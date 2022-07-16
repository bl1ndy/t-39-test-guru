# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage!, only: %i[show update result gist]
  before_action :find_test!, only: %i[show update result]

  def show
    @endtime = @test_passage.created_at + @test_passage.test.countdown
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || !@test_passage.passed_by_time?
      @test_passage.pass

      if @test_passage.passed?
        AchievementService.new(@test_passage).call
        TestsMailer.completed_test(@test_passage).deliver_now
      end

      redirect_to result_test_passage_path(@test_passage)
    else
      @endtime = @test_passage.created_at + @test_passage.test.countdown

      render :show
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def result; end

  def gist
    client = Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN', nil))
    service = GistQuestionService.new(@test_passage.current_question, client)
    result = service.call
    gist_url = result.html_url

    flash_options = service.success? ? { notice: t('.success', link: gist_url) } : { danger: t('.failed') }

    save_gist(gist_url)

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage!
    @test_passage = TestPassage.find(params[:id])
  end

  def find_test!
    @test = @test_passage.test
  end

  def save_gist(gist_url)
    @test_passage.current_question.gists.create(
      user_id: @test_passage.user.id,
      url: gist_url
    )
  end
end

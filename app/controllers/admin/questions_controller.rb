# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_test!, only: %i[new create]
  before_action :find_question!, except: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      flash[:success] = t('.create.success')

      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      flash[:success] = t('.update.success')

      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    flash[:success] = t('.destroy.success')

    redirect_to admin_test_path(@question.test)
  end

  private

  def find_test!
    @test = Test.find(params[:test_id])
  end

  def find_question!
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end
end

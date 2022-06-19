# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test!
  before_action :find_question!, only: %i[show destroy]

  def index; end

  def show; end

  def new; end

  def create
    question = @test.questions.build(question_params)

    if question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def find_test!
    @test = Test.find(params[:test_id])
  end

  def find_question!
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end

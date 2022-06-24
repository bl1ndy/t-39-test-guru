# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer!, except: %i[new create]
  before_action :find_question!, only: %i[new create]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy

    redirect_to @answer.question
  end

  private

  def find_answer!
    @answer = Answer.find(params[:id])
  end

  def find_question!
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end

# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  before_action :find_answer!, except: %i[new create]
  before_action :find_question!, only: %i[new create]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      flash[:success] = t('.create.success')

      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @answer.update(answer_params)
      flash[:success] = t('.update.success')

      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy

    flash[:success] = t('.destroy.success')

    redirect_to admin_question_path(@answer.question)
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

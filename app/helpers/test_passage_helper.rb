# frozen_string_literal: true

module TestPassageHelper
  def current_question_number(question)
    question.test.questions.order(:id).index(question) + 1
  end
end

# frozen_string_literal: true

module QuestionHelper
  def question_header(question)
    base_header = "#{question.test.title} Question"
    question.new_record? ? "Create New #{base_header}" : "Edit #{base_header}"
  end
end

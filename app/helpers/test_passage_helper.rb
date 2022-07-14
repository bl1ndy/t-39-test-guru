# frozen_string_literal: true

module TestPassageHelper
  def current_question_number(question)
    question.test.questions.order(:id).index(question) + 1
  end

  def timer(endtime)
    tag.div(id: 'countdown',
            class: 'row justify-content-center border rounded-pill mb-4',
            data: { endtime: })
  end
end

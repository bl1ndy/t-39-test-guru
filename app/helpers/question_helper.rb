# frozen_string_literal: true

module QuestionHelper
  def question_header(question)
    base_header = t('admin.questions.helpers.question_header.base_header', question_title: question.test.title)

    if question.new_record?
      t('admin.questions.helpers.question_header.create', base_header:)
    else
      t('admin.questions.helpers.question_header.update', base_header:)
    end
  end
end

# frozen_string_literal: true

class TestPassage < ApplicationRecord
  self.table_name = 'tests_users'

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create

  private

  def before_validation_set_current_question
    self.current_question = test.questions.first
  end
end

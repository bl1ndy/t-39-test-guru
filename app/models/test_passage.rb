# frozen_string_literal: true

class TestPassage < ApplicationRecord
  self.table_name = 'tests_users'

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create
  before_update :before_update_set_next_question

  scope :passed, -> { where(passed: true) }

  MINIMAL_SUCCESS_RATE = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def pass
    update_column(:passed, true) if passed_by_answers? # rubocop:disable Rails/SkipsModelValidations
  end

  def current_progress
    passed_questions_count = test.questions.order(:id).index(current_question)
    (passed_questions_count.to_f / test.questions.count * 100).round
  end

  def success_rate
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def passed_by_time?
    return true if test.countdown.zero?

    created_at + test.countdown >= Time.zone.now
  end

  private

  def before_validation_set_current_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    return false unless answer_ids

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def passed_by_answers?
    success_rate >= MINIMAL_SUCCESS_RATE
  end
end

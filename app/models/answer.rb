# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  ANSWERS_LIMIT_FOR_QUESTION = 4

  validates :body, presence: true
  validate :validate_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_count
    return unless question.answers.count == ANSWERS_LIMIT_FOR_QUESTION

    errors.add(:answers, 'are too much for this question')
  end
end

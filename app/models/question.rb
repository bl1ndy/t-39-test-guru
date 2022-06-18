# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answers

  private

  def validate_answers
    errors.add(:answers, 'are too much') if answers.count > 4
  end
end

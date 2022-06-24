# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: :author_id,
           dependent: nil,
           inverse_of: :author
  has_many :test_passages, dependent: nil
  has_many :tests, through: :test_passages

  has_secure_password

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end

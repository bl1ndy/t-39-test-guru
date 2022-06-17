# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: :author_id,
           dependent: nil,
           inverse_of: :author
  has_many :test_passages, dependent: nil
  has_many :tests, through: :test_passages

  def tests_by_level(level)
    tests.where(level:)
  end
end

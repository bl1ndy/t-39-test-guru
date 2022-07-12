# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests,
           class_name: 'Test',
           foreign_key: :author_id,
           dependent: nil,
           inverse_of: :author
  has_many :test_passages, dependent: nil
  has_many :tests, through: :test_passages
  has_many :gists, dependent: nil
  has_many :achievements, dependent: :destroy
  has_many :badges, through: :achievements

  validates :first_name, :last_name, presence: true, length: { maximum: 255 }

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end

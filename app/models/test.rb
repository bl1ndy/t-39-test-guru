# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: nil
  has_many :users, through: :test_passages

  class << self
    def by_category(category)
      joins(:category)
        .where(categories: { title: category })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end

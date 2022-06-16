# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :users # rubocop:disable Rails/HasAndBelongsToMany

  class << self
    def by_category(category)
      joins(:category)
        .where(categories: { title: category })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end

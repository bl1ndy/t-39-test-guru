# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests # rubocop:disable Rails/HasAndBelongsToMany

  def tests_by_level(level)
    tests.where(level:)
  end
end

# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  enum rule: {
    no_rule: 0,
    all_by_category: 1,
    all_by_difficulty: 2,
    first_attempt_success: 3
  }

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :img_url, presence: true,
                      format: { with: /\A.+\.(jpe?g|JPE?G|png|PNG)\z/,
                                message: :not_an_image }
end

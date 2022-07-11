# frozen_string_literal: true

class Badge < ApplicationRecord
  enum rule: {
    no_rule: 0,
    all_backend: 1,
    all_frontend: 2,
    all_easy: 3,
    all_medium: 4,
    all_hard: 5,
    first_attempt_success: 6
  }

  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :img_url, presence: true,
                      format: { with: /\A.+\.(jpe?g|JPE?G|png|PNG)\z/,
                                message: :not_an_image }
end

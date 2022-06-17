# frozen_string_literal: true

class TestPassage < ApplicationRecord
  self.table_name = 'tests_users'

  belongs_to :test
  belongs_to :user
end

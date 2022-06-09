# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def about; end

  def author
    birthday = Date.new(1990, 6, 30)
    @age = Time.zone.today.year - birthday.year
    @age -= 1 if Time.zone.today < birthday + @age.years
  end
end

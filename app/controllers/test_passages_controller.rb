# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage!, only: %i[show update result]

  def show; end

  def update; end

  def result; end

  def find_test_passage!
    @test_passage = TestPassage.find(params[:id])
  end
end

# frozen_string_literal: true

class AchievementService
  RULES_METHODS = {
    no_rule: :no_rule,
    first_attempt_success: :first_attempt_success,
    all_backend: :all_by_category,
    all_frontend: :all_by_category,
    all_easy: :all_by_difficulty,
    all_medium: :all_by_difficulty,
    all_hard: :all_by_difficulty
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @category = @test.category.title
    @level = @test.level
    @achieved_badges = []
  end

  def call
    return if already_passed?

    Badge.all.each do |badge|
      @achieved_badges << method(RULES_METHODS[badge.rule.to_sym]).call
    end

    reward(@achieved_badges.uniq)
  end

  private

  def no_rule; end

  def first_attempt_success
    return if @user.test_passages.where(test: @test).count > 1

    Badge.find_by(rule: :first_attempt_success)
  end

  def all_by_category
    tests = Test.published.by_category(@category)
    passed_tests = passed_tests(tests)

    Badge.find_by(rule: "all_#{@category.downcase}".to_sym) if passed_tests.count == tests.count
  end

  def all_by_difficulty
    tests = Test.published.send(difficulty)
    passed_tests = passed_tests(tests)

    Badge.find_by(rule: "all_#{difficulty.downcase}".to_sym) if passed_tests.count == tests.count
  end

  def difficulty
    case @level
    when 0..1 then :easy
    when 2..4 then :medium
    when 5..Float::INFINITY then :hard
    end
  end

  def already_passed?
    @user.test_passages.passed.where(test: @test).count > 1
  end

  def reward(badges)
    badges.each do |badge|
      @user.achievements.create(badge:)
    end
  end

  def passed_tests(tests)
    tests.joins(:test_passages)
         .distinct
         .where(test_passages: { user: @user, passed: true })
  end
end

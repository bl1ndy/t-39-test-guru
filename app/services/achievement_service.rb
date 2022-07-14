# frozen_string_literal: true

class AchievementService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @category = @test.category.title
  end

  def call
    return if already_passed?

    Badge.all.each do |badge|
      next if badge.rule == 'no_rule'

      @user.badges << badge if send("#{badge.rule}_award?", badge.sub_rule)
    end
  end

  private

  def first_attempt_success_award?(_sub_rule)
    @user.test_passages.where(test: @test).count == 1
  end

  def all_by_category_award?(sub_rule)
    return if @category != sub_rule.downcase.capitalize

    tests = Test.published.by_category(@category)
    passed_tests = passed_tests(tests)
    passed_tests.count == tests.count
  end

  def all_by_difficulty_award?(sub_rule)
    return if difficulty != sub_rule.downcase.to_sym

    tests = Test.published.send(difficulty)
    passed_tests = passed_tests(tests)
    passed_tests.count == tests.count
  end

  def difficulty
    case @test.level
    when 0..1 then :easy
    when 2..4 then :medium
    when 5..Float::INFINITY then :hard
    end
  end

  def already_passed?
    @user.test_passages.passed.where(test: @test).count > 1
  end

  def passed_tests(tests)
    tests.joins(:test_passages)
         .distinct
         .where(test_passages: { user: @user, passed: true })
  end
end

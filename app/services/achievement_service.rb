# frozen_string_literal: true

class AchievementService
  def initialize(test_passage, user)
    @badges = Badge.all.each_with_object({}) do |badge, badges|
      badges[badge.rule.to_sym] = badge
      badges
    end
    @test_passage = test_passage
    @user = user
    @test = @test_passage.test
    @category = @test.category.title
    @level = @test.level
  end

  def call
    return if already_passed?

    first_attempt_success if @badges[:first_attempt_success]
    all_by_category if @badges["all_#{@category.downcase}".to_sym]
    all_by_difficult if @badges["all_#{difficulty}".to_sym]
  end

  private

  def first_attempt_success
    return unless @user.test_passages.where(test: @test).count == 1

    @user.achievements.create(badge: @badges[:first_attempt_success])
  end

  def all_by_category
    tests = Test.published.by_category(@category)
    passed_tests = @user.success_passages
                        .select { |passage| passage.test.category.title == @category }
                        .map(&:test)
    return unless tests.all? { |test| passed_tests.include?(test) }

    @user.achievements.create(badge: @badges["all_#{@category.downcase}".to_sym])
  end

  def all_by_difficult
    tests = Test.published.send(difficulty)
    passed_tests = @user.success_passages
                        .select { |passage| tests.include?(passage.test) }
                        .map(&:test)
    return unless tests.all? { |test| passed_tests.include?(test) }

    @user.achievements.create(badge: @badges["all_#{difficulty}".to_sym])
  end

  def difficulty
    case @level
    when 0..1 then :easy
    when 2..4 then :medium
    when 5..Float::INFINITY then :hard
    end
  end

  def already_passed?
    @user.success_passages.count { |passage| passage.test == @test } > 1
  end
end

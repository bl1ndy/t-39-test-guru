# frozen_string_literal: true

module AchievementHelper
  def badge_description(badge)
    t("achievements.helpers.descriptions.#{badge.rule.to_sym}", sub_rule: badge.sub_rule&.capitalize)
  end
end

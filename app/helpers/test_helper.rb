# frozen_string_literal: true

module TestHelper
  def formatted_countdown(seconds)
    return t('admin.tests.helpers.formatted_countdown.not_limited') if seconds.zero?

    hours = seconds / (60 * 60)
    minutes = (seconds / 60) % 60
    seconds = seconds % 60

    [hours, minutes, seconds].map { |t| t.to_s.rjust(2, '0') }.join(':')
  end
end

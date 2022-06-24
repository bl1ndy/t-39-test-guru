# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def flash_message
    flash.map do |message_type, message|
      content_tag(:div, message, class: "alert alert-#{message_type}")
    end.join
  end
end

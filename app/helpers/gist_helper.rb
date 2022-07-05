# frozen_string_literal: true

module GistHelper
  def gist_question_link(gist)
    question = gist.question
    truncated = question.body.truncate(25)

    link_to truncated, admin_question_path(question), class: 'text-decoration-none'
  end

  def gist_link(gist)
    hash = URI.parse(gist.url).path.split('/').last

    link_to hash, gist.url, target: '_blank', class: 'text-decoration-none', rel: 'noopener'
  end
end

# frozen_string_literal: true

class ContactsMailer < ApplicationMailer
  def send_form(user:, message:)
    @user = user
    @message = message

    mail to: 'ayoblindstone@gmail.com'
  end
end

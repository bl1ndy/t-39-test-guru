# frozen_string_literal: true

class ContactsMailer < ApplicationMailer
  def send_form(form)
    @user = form[:user]
    @message = form[:message]

    mail to: 'ayoblindstone@gmail.com'
  end
end

# frozen_string_literal: true

class ContactsMailer < ApplicationMailer
  def send_form(user:, message:)
    @user = user
    @message = message
    admin = Admin.first

    mail to: admin.email
  end
end

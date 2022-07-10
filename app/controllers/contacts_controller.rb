# frozen_string_literal: true

class ContactsController < ApplicationController
  def new; end

  def create
    user_message = params.dig(:contact_form, :message)

    if valid?(user_message)
      ContactsMailer.send_form(user: current_user, message: user_message).deliver_now

      flash[:success] = t('.success')
      redirect_to new_contact_path
    else
      flash.now[:danger] = t('.failed')

      render :new
    end
  end

  private

  def valid?(message)
    /\S+/.match?(message)
  end
end

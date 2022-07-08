# frozen_string_literal: true

class ContactsController < ApplicationController
  def new; end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def send_form
    @form = {
      user: current_user,
      message: params.dig(:contact_form, :message)
    }

    if valid?(@form[:message])
      ContactsMailer.send_form(@form).deliver_now

      flash.now[:success] = t('.success')
      redirect_to contacts_path
    else
      flash.now[:danger] = t('.failed')

      render :new
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  private

  def valid?(message)
    /\S+/.match?(message)
  end
end

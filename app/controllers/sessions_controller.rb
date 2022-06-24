# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  # rubocop:disable Metrics/AbcSize
  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      log_in(@user)
      flash[:success] = "Welcome back, #{@user.name.capitalize}!"

      redirect_to session[:forwarding_url] || root_path
    else
      flash.now[:danger] = 'Incorrect email and/or password!'

      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    logout

    redirect_to root_path
  end
end

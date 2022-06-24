# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  # rubocop:disable Metrics/AbcSize
  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.name.capitalize}!"

      redirect_to tests_path
    else
      flash.now[:danger] = 'Incorrect email and/or password!'

      render :new
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    reset_session

    redirect_to tests_path
  end
end

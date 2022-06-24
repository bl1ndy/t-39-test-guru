# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern

  included do
    private

    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user.present?
    end

    def logout
      reset_session
      @current_user = nil
    end

    helper_method :current_user, :logged_in?
  end
end

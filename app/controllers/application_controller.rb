# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    current_user.is_a?(Admin) ? admin_tests_path : root_path
  end
end

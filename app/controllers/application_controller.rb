# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Auth

  before_action :authenticate_user!
end

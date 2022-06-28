# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    return if current_user.admin?

    flash[:info] = t('admin.base.info')
    redirect_to root_path
  end
end

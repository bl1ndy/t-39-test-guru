# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash[:success] = t('.create.success')

      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      flash[:success] = t('.update.success')

      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    flash[:success] = t('.destroy.success')

    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :rule, :sub_rule, :img_url)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end

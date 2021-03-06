# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :find_test!, only: %i[show edit update update_inline destroy]

  def index; end

  def new
    @test = current_user.created_tests.build
  end

  def create
    @test = current_user.created_tests.build(test_params)

    if @test.save
      flash[:success] = t('.create.success')
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      flash[:success] = t('.update.success')
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      flash[:success] = t('.update.success')
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    flash[:success] = t('.destroy.success')
    redirect_to admin_tests_path
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test!
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :countdown, :published)
  end
end

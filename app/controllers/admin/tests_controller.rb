# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test!, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = current_user.created_tests.build
  end

  def create
    @test = current_user.created_tests.build(test_params)

    if @test.save
      flash[:success] = 'Test successfully created!'
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      flash[:success] = 'Test successfully updated!'
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    flash[:success] = 'Test successfully deleted!'
    redirect_to admin_tests_path
  end

  private

  def find_test!
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end

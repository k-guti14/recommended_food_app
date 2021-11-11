class FoodsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @foods = Food.order(:created_at)
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.create!(food_params)
    redirect_to food
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit; end

  def update
    @food.update!(food_params)
    redirect_to @food
  end

  def destroy
    @food.destroy!
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :image, :comment)
  end

  def set_post
    @food = current_user.foods.find(params[:id])
  end
end

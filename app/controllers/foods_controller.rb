class FoodsController < ApplicationController
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

  private

  def food_params
    params.require(:food).permit(:name, :comment)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

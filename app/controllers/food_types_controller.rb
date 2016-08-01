class FoodTypesController < ApplicationController
  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = Cuisine.new(params.require(:food_type).permit(:name))
    if @food_type.save
      redirect_to @food_type
    else
      flash.now[:alert] = 'Não foi possível criar um tipo de comida'
      render 'new'
    end
  end
end

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @cuisines = Cuisine.all
    @food_types = FoodType.all
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe)
                        .permit(:name, :cuisine_id, :food_type_id, :serves,
                                :cooking_time, :difficulty, :ingredients,
                                :directions, :picture))
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:alert] = 'Não foi possível criar uma receita'
      render 'new'
    end
  end
end

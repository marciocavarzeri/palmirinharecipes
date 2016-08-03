class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :set_collections, only: [:new, :edit]
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = new_user_recipe
  end

  def create
    @recipe = new_user_recipe(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:alert] = 'Não foi possível criar uma receita'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:notice] = 'Não foi possível atualizar essa receita'
      render 'edit'
    end
  end

  private

  def new_user_recipe(params = nil)
    current_user.recipes.new(params)
  end

  def recipe_params
    params.require(:recipe)
          .permit(:name, :cuisine_id, :food_type_id, :serves, :cooking_time,
                  :difficulty, :ingredients, :directions, :picture)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_collections
    @cuisines = Cuisine.all
    @food_types = FoodType.all
  end
end

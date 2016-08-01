class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = @cuisine.recipes

    flash.now[:notice] = 'Nenhuma receita disponível' if @recipes.empty?
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))
    if @cuisine.save
      redirect_to @cuisine
    else
      flash.now[:alert] = 'Não foi possível criar uma cozinha'
      render 'new'
    end
  end
end

class HomeController < ApplicationController
  def index
    @cuisines = Cuisine.all
    @recipes = Recipe.last_twenty
  end
end

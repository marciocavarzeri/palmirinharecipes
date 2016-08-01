class HomeController < ApplicationController
  def index
    @recipes = Recipe.last_twenty
  end
end

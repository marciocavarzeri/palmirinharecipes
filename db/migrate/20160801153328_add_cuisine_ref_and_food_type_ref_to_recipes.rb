class AddCuisineRefAndFoodTypeRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :cuisine, foreign_key: true
    add_reference :recipes, :food_type, foreign_key: true
  end
end

class RemoveCuisineAndFoodTypeFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :cuisine, :string
    remove_column :recipes, :food_type, :string
  end
end

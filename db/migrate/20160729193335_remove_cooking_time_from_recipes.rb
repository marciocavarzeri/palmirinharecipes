class RemoveCookingTimeFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :cooking_time, :string
  end
end

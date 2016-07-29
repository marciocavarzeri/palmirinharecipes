class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :food_type
      t.integer :serves
      t.string :cooking_time
      t.string :difficulty
      t.text :ingredients
      t.text :directions

      t.timestamps
    end
  end
end

class Recipe < ApplicationRecord
  validates :name, :cuisine, :food_type, :difficulty,
            :ingredients, :directions,
            presence: true
end

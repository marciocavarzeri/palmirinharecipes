class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type_id, :difficulty,
            :ingredients, :directions, :user_id,
            presence: true
  belongs_to :cuisine
  belongs_to :food_type
  belongs_to :user
  has_attached_file :picture,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\Z}

  # Refatorar
  def self.last_twenty
    last(20).reverse
  end
end

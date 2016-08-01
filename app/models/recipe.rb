class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type_id, :difficulty,
            :ingredients, :directions,
            presence: true
  belongs_to :cuisine
  belongs_to :food_type
  has_attached_file :picture,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\Z}
end

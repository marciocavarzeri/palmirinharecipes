class Recipe < ApplicationRecord
  validates :name, :cuisine, :food_type, :difficulty,
            :ingredients, :directions,
            presence: true

  has_attached_file :picture,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\Z}
end

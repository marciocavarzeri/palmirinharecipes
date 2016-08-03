class User < ApplicationRecord
  has_many :recipes
  devise :database_authenticatable, :rememberable, :trackable
end

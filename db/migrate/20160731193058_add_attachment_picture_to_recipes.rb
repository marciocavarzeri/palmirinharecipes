class AddAttachmentPictureToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_attachment :recipes, :picture
  end
end

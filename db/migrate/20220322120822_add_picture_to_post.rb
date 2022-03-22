class AddPictureToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :picture, :string
  end
end

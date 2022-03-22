class AddPicturesToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :pictures, :json
  end
end

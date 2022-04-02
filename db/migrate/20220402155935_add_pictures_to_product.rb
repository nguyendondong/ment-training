class AddPicturesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :pictures, :json
  end
end

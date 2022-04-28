class AddPicturesToVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :variants, :pictures, :json
  end
end

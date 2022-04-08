class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name , default: "user"
      t.string :destription 
      t.timestamps
    end
  end
end

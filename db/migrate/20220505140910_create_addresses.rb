class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zipcode
      t.string :phone
      t.string :company
      t.string :email
      t.string :sex

      t.timestamps
    end
  end
end

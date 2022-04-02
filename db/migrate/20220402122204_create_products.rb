class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :sku 
      t.string :description
      t.text :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end

class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.references :product, null: false, foreign_key: true
      t.string :sku
      t.string :color
      t.string :size
      t.string :cost_price

      t.timestamps
    end
  end
end

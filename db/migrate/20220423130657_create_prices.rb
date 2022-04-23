class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.string :amount
      t.references :variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.float :item_total
      t.float :total
      t.string :state
      t.float :adjustment_total
      t.datetime :completed_at
      t.float :payment_total
      t.string :shipment_state
      t.string :payment_state
      t.string :email

      t.timestamps
    end
  end
end

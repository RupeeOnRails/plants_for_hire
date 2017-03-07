class CreateStockOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_orders do |t|
      t.integer :merchant_id
      t.string :merchant_type
    end
  end
end

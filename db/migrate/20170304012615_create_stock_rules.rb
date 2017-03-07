class CreateStockRules < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_rules do |t|
      t.integer :stock_order_id
      t.integer :item_id
      t.integer :price
      t.integer :restock
    end
  end
end

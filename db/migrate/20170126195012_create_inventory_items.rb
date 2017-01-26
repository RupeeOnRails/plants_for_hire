class CreateInventoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_items do |t|
      t.integer :inventory_id
      t.integer :item_id
      t.integer :quantity
    end
  end
end

class CreateUpgradeStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :upgrade_stocks do |t|
      t.integer :upgrade_id
      t.integer :upgrade_shop_id
      t.integer :price
    end
  end
end

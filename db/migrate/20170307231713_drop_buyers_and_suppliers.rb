class DropBuyersAndSuppliers < ActiveRecord::Migration[5.0]
  def change
    drop_table :buyers
    drop_table :suppliers
  end
end

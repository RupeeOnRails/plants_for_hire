class AddSizeToStockOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :stock_orders, :size, :integer
  end
end

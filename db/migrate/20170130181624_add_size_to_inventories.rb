class AddSizeToInventories < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :size, :integer
  end
end

class AddTypeToInventories < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :type, :string
  end
end

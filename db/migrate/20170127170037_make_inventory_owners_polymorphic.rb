class MakeInventoryOwnersPolymorphic < ActiveRecord::Migration[5.0]
  def change
    rename_column :inventories, :player_id, :owner_id
    add_column :inventories, :owner_type, :string
  end
end

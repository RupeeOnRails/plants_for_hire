class RemoveReferencesToDestinations < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :destination_id
    drop_table :destinations
  end
end

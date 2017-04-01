class CreateUpgradeShops < ActiveRecord::Migration[5.0]
  def change
    create_table :upgrade_shops do |t|
      t.string :name
      t.integer :location_id
    end
  end
end

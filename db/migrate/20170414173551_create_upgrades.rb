class CreateUpgrades < ActiveRecord::Migration[5.0]
  def change
    create_table :upgrades do |t|
      t.integer :speed
      t.integer :inventory
      t.string :name
      t.integer :tier
      t.string :type
      t.integer :inventory
      t.integer :speed
    end
  end
end

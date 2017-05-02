class CreatePlayerUpgrades < ActiveRecord::Migration[5.0]
  def change
    create_table :player_upgrades do |t|
      t.integer :player_id
      t.integer :upgrade_id
    end
  end
end

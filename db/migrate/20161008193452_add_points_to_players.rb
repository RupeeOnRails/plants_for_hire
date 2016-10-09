class AddPointsToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :points, :float
  end
end

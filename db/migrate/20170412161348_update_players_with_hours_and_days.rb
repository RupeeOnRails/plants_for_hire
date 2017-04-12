class UpdatePlayersWithHoursAndDays < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :points, :hours
    add_column :players, :day, :integer
  end
end

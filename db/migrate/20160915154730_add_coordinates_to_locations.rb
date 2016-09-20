class AddCoordinatesToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :x_position, :integer
    add_column :locations, :y_position, :integer
  end
end

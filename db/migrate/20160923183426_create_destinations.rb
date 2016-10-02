class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.integer :location_id
      t.integer :next_destination_id
    end
  end
end

class CreatePaths < ActiveRecord::Migration[5.0]
  def change
    create_table :paths do |t|
      t.references :location, index: true, foreign_key: true
      t.references :neighbor, index: true

      t.timestamps null: false
    end

    add_foreign_key :paths, :locations, column: :neighbor_id
    add_index :paths, [:location_id, :neighbor_id], unique: true
  end
end

class AddDistanceToPaths < ActiveRecord::Migration[5.0]
  def change
    add_column :paths, :distance, :integer
  end
end

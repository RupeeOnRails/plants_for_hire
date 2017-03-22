class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :player_id
      t.integer :merchant_id
    end
  end
end

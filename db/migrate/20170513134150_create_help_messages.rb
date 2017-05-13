class CreateHelpMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :help_messages do |t|
      t.integer :player_id
      t.integer :help_text_id
      t.boolean :viewed
    end
  end
end

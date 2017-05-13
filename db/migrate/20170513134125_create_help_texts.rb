class CreateHelpTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :help_texts do |t|
      t.string :title
      t.text :text
    end
  end
end

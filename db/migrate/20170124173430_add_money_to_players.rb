class AddMoneyToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :money, :integer, default: 0
  end
end


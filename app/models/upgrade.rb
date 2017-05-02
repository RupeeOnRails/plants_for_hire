class Upgrade < ApplicationRecord
  has_many :player_upgrades
  has_many :upgrade_stocks
  has_many :upgrade_shops, through: :upgrade_stocks

  def to_s
    name
  end
end

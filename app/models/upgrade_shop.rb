class UpgradeShop < ApplicationRecord
  belongs_to :location
  has_many :upgrade_stocks
  has_many :upgrades, through: :upgrade_stocks

  def add_upgrade(upgrade, price)
    stock = UpgradeStock.new
    stock.upgrade = upgrade
    stock.price = price
    stock.save

    upgrade_stocks << stock
  end

  def to_s
    name
  end
end

class UpgradeShop < ApplicationRecord
  belongs_to :location
  has_many :upgrades
end

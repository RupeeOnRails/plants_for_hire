class UpgradeStock < ApplicationRecord
  belongs_to :upgrade
  belongs_to :upgrade_shop

  def tier
    upgrade.tier
  end
end

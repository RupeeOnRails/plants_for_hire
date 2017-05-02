class PlayerUpgrade < ApplicationRecord
  belongs_to :player
  belongs_to :upgrade
end

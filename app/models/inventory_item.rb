class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :item

  def to_s
    "#{item} (x#{quantity})"
  end
end

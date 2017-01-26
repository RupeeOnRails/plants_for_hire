class Inventory < ApplicationRecord
  has_many :inventory_items
  has_many :items, through: :inventory_items
  belongs_to :player

  def number_of_items
    inventory_items.size
  end

  def to_s
    "#{player}'s Inventory: " + inventory_items.map{|t| t.to_s}.join(', ')
  end
end

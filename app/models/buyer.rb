class Buyer < ApplicationRecord
  belongs_to :location
  has_one :inventory, as: :owner
  has_many :inventory_items, through: :inventory
  has_one :stock_order, as: :merchant
  has_many :stock_rules, through: :stock_order

  def inv
    inventory
  end

  def to_s
    name
  end

  def items
    inventory.items
  end

  def price_for(item)
    stock_rules.find {|rule| rule.item == item}.price
  end

  def restock
    stock_rules.each do |rule|
      current_restock = if (inventory.number_of_items + rule.restock) < 0
        -1 * inventory.number_of_items
      else
        rule.restock
      end
      inventory.adjust_item rule.item, current_restock
    end
  end
end

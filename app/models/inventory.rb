class Inventory < ApplicationRecord
  has_many :inventory_items, dependent: :destroy
  has_many :items, through: :inventory_items
  belongs_to :owner, polymorphic: true

  def to_s
    if inventory_items.blank?
      '(empty)'
    else
      inventory_items.map{|t| t.to_s}.join(', ')
    end
  end

  def adjust_item(item, quantity)
    if quantity < 0
      remove_item item, (quantity * -1)
    else
      add_item item, quantity
    end
  end

  def add_item(item, quantity = 1)
    if items.include? item
      ii = inventory_items.find{|ii| ii.item == item}
      if quantity <= self.space
        ii.quantity += quantity
        ii.save
      end
    else
      ii = InventoryItem.new
      ii.item = item
      if quantity <= self.space
        ii.quantity = quantity
        inventory_items << ii
      end
    end
  end

  def remove_item(item, quantity = 1)
    if items.include? item
      ii = inventory_items.find{|ii| ii.item == item}
      current_stock = ii.quantity
      new_stock = current_stock - quantity
      if new_stock > 0
        ii.quantity = new_stock
        ii.save
      elsif new_stock == 0
        inventory_items.delete ii
        ii.destroy
      else
        # do nothing, new_stock is negative
      end
    end
  end

# unload all of a certain item into another inventory
  def unload_to(inventory, item)
    if inventory.space > 0
      quantity = if inventory.space >= item_count(item)
        # move all items
        item_count(item)
      else
        # fill inventory but have items left over
        inventory.space
      end

      remove_item(item, quantity)
      inventory.add_item(item, quantity)
      quantity
    end
  end

  def number_of_items
    inventory_items.map{|ii| ii.quantity}.reduce(:+) || 0
  end

  def space
    size - number_of_items
  end

  def item_count(item)
    inventory_items.find{|ii| ii.item == item}.quantity
  end

end

class Inventory < ApplicationRecord
  has_many :inventory_items
  has_many :items, through: :inventory_items
  belongs_to :owner, polymorphic: true

  def to_s
    inventory_items.map{|t| t.to_s}.join(', ')
  end

  def add_item(item, quantity = 1)
    if self.items.include? item
      iventory_item = inventory_items.find{|ii| ii.item == item}
      iventory_item.quantity += quantity
      iventory_item.save
    else
      inventory_item = InventoryItem.new
      inventory_item.item = item
      inventory_item.quantity = quantity
      inventory_items << inventory_item
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

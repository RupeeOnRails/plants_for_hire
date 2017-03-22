class Contact < ApplicationRecord
  belongs_to :player
  belongs_to :merchant
  has_one :inventory, as: :owner, dependent: :destroy
  has_many :inventory_items, through: :inventory
  has_many :items, through: :inventory_items

  def inv
    inventory
  end

  def self.make(player, merchant)
    contact = Contact.new
    contact.player = player
    contact.merchant = merchant
    contact.save
    
    i = Inventory.new
    i.owner = contact
    i.size = merchant.stock_order.size
    i.save

    if merchant.class == Supplier
      item = merchant.stock_order.stock_rules.first.item
      contact.inventory.add_item item, i.size
    end

    contact
  end

  def restock
    inventory.restock(merchant.stock_order)
  end


end

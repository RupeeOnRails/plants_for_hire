class Player < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :destination, optional: true
  has_one :inventory, as: :owner
  has_many :inventory_items, through: :inventory
  has_many :items, through: :inventory_items
  has_many :contacts
  has_many :merchants, through: :contacts

  # after_create :initialize_inventory

  STARTING_LOCATION = 19

  after_commit :set_home_location, on: :create

  # def initialize_inventory
  #   i = Inventory.new
  #   i.size = 24
  #   i.save
  #   self.inventory = i
  # end

  def set_home_location
    self.location_id = STARTING_LOCATION
    save
  end

  # if success returns falsey, failure returns error message
  def set_destination(location)
    if !has_neighbor?(location)
      'Please select a neighboring location.'
    else
      if points >= 0.25
        self.points -= 0.25
        set_location location
        save
        false
      else
        'Not enough points.'
      end
    end
  end

  def set_location(location)
    self.location = location
    save
  end

  def reset_points
    self.points = 16
    save
  end

  def has_neighbor?(location)
    self.location.neighbors.include?(location)
  end

  def location_id
    location.id
  end

  def to_s
    name
  end

  def buy_from(supplier_contact, item)
    source = supplier_contact.inventory
    target = inventory

    # something about cost



    
    source.unload_to target, item
  end

  def sell_to(buyer_contact, item)
    return false if item.nil?

    source = inventory
    target = buyer_contact.inventory

    cost = buyer_contact.merchant.price_for(item)
    
    quantity = source.unload_to target, item
    total = cost * quantity
    self.money += total
    save
  end
  
  def inv
    inventory
  end

  def location_actions
    location.available_actions
  end

  def buy
    if location_actions.include? :buy
      supplier = location.suppliers.first
      contact = get_or_create_contact_for supplier
      item = contact.items.first
      buy_from contact, item
    end
  end

  def sell
    if location_actions.include? :sell
      buyer = location.buyers.first
      contact = get_or_create_contact_for buyer
      item = items.first
      sell_to contact, item
    end

  end

  def finish_day
    reset_points
    set_home_location
    trigger_restock
  end

  def trigger_restock
    contacts.each {|c| c.restock}
  end

  def get_or_create_contact_for(merchant)
    if merchants.include? merchant
      contacts.find {|c| c.merchant == merchant}
    else
      Contact.make(self, merchant)
    end
  end
end

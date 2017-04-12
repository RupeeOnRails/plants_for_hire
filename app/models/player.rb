class Player < ApplicationRecord
  belongs_to :location, optional: true
  has_one :inventory, as: :owner
  has_many :inventory_items, through: :inventory
  has_many :items, through: :inventory_items
  has_many :contacts
  has_many :merchants, through: :contacts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  after_create :init

  STARTING_LOCATION = 19

  def init
    self.hours = 16
    self.day = 1
    self.location = Location.find STARTING_LOCATION
    save
    new_inventory = Inventory.new
    new_inventory.size = 24
    new_inventory.owner = self
    new_inventory.save
  end

  def set_home_location
    self.location_id = STARTING_LOCATION
    save
  end

  # if success returns falsey, failure returns error message
  def move_to(location)
    if !has_neighbor?(location)
      'Please select a neighboring location.'
    else
      if hours >= 0.25
        self.hours -= 0.25
        set_location location
        save
        false
      else
        'The day is over. Click "Finish Day"'
      end
    end
  end

  def set_location(location)
    self.location = location
    save
  end

  def reset_hours
    self.hours = 16
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
    reset_hours
    self.day = self.day + 1
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

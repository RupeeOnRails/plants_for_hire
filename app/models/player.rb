class Player < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :destination, optional: true
  has_one :inventory, as: :owner
  has_many :inventory_items, through: :inventory
  has_many :items, through: :inventory_items

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
    if next_location == self.location
      self.destination = nil
      save
    end
    if traveling?
      'Already traveling'
    elsif !has_neighbor?(location)
      'Please select a neighboring location.'
    else
      if points >= 0.25
        self.points -= 0.25
        self.destination = Destination.to(location)
        save
        # MoveWorker.perform_async(self.id, location.id)

        self.set_location location
        self.destination = nil
        self.save
        # MoveBroadcast.perform_async(player_id)


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

  def traveling?
    !destination.nil?
  end

  def has_neighbor?(location)
    self.location.neighbors.include?(location)
  end

  def location_id
    location.id
  end

  def next_location
    destination ? destination.location : nil
  end

  def next_location_id
    destination ? destination.location_id : 0
  end

  def to_s
    name
  end

  def buy_from(supplier, item)
    s = supplier.inventory
    p = inventory

    # something about cost
    
    s.unload_to p, item
  end

  def sell_to(buyer, item)
    s = inventory
    p = buyer.inventory

    # something about cost
    
    s.unload_to p, item
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
      item = supplier.items.first
      buy_from supplier, item
    end
  end

  def sell
    if location_actions.include? :sell
      buyer = location.buyers.first
      item = items.first
      sell_to buyer, item
    end

  end
end

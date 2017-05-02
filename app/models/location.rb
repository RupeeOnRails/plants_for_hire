class Location < ApplicationRecord
  has_many :paths
  has_many :neighbors, through: :paths, dependent: :destroy
  has_many :players
  has_many :merchants
  has_many :suppliers
  has_many :buyers
  has_one :upgrade_shop
  
  accepts_nested_attributes_for :paths

  def add_neighbor(id)
    neighbors << Location.find(id)
  end
  alias_method :add, :add_neighbor

  def to_s
    id.to_s
  end

  def x
    x_position || 0
  end

  def x=(arg)
    self.x_position = arg
  end

  def y
    y_position || 0
  end

  def y=(arg)
    self.y_position = arg
  end

  def coordinates
    [x_position, y_position]
  end

  def available_actions
    list = []
    list << :buy if suppliers.size > 0
    list << :sell if buyers.size > 0
    list
  end

  def neighbor_coordinates
    neighbors.map do |location|
      [location.x_position, location.y_position]
    end
  end

  def neighbor_relative_coordinates
    neighbors.map do |location|
      [location, location.x - x, location.y - y]
    end
  end

  # y > x, y < -x
  def left
    relative = neighbor_relative_coordinates.find do |neighbor|
      neighbor[2] > neighbor[1] && neighbor[2] < -neighbor[1]
    end
    relative[0] if relative
  end
  
  # y < x, y < -x
  def up
    relative = neighbor_relative_coordinates.find do |neighbor|
      neighbor[2] < neighbor[1] && neighbor[2] < -neighbor[1]
    end
    relative[0] if relative
  end


  # y < x, y > -x
  def right
    relative = neighbor_relative_coordinates.find do |neighbor|
      neighbor[2] < neighbor[1] && neighbor[2] > -neighbor[1]
    end
    relative[0] if relative
  end

  # y > x, y > -x
  def down
    relative = neighbor_relative_coordinates.find do |neighbor|
      neighbor[2] > neighbor[1] && neighbor[2] > -neighbor[1]
    end
    relative[0] if relative
  end

end
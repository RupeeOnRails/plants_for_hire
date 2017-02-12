class Location < ApplicationRecord
  has_many :paths
  has_many :neighbors, through: :paths, dependent: :destroy
  has_many :players
  has_many :suppliers

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

end
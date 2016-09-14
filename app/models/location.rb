class Location < ApplicationRecord
  has_many :paths
  has_many :neighbors, through: :paths, dependent: :destroy

  def add_neighbor(id)
    neighbors << Location.find(id)
  end
  alias_method :add, :add_neighbor

  def to_s
    id.to_s
  end

end
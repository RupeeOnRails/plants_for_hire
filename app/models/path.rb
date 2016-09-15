class Path < ApplicationRecord
  belongs_to :location
  belongs_to :neighbor, class_name: 'Location'

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_path_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_path_options)
  end

  def inverses
    self.class.where(inverse_path_options)
  end

  def inverse_path_options
    { neighbor_id: location_id, location_id: neighbor_id }
  end




  def self.draw(from_id, to_id)
    Location.find(from_id).add_neighbor to_id
  end

  def neighbor_and_distance
    "#{neighbor}-#{0}"
  end

end

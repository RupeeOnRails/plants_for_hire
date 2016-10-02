class Player < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :destination, optional: true

  STARTING_LOCATION = 19

  after_commit :set_home_location, on: :create

  def set_home_location
    self.location = Location.find STARTING_LOCATION
  end

  # def set_destination(destination)
  #   self.location = destination.location
  # end

  def set_destination(location)
    self.location = location
    save
  end

end

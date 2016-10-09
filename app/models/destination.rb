class Destination < ApplicationRecord
  belongs_to :location
  belongs_to :next_destination, class_name: 'Destination', optional: true

  def self.to(location)
    dest = Destination.new
    dest.location = location
    dest.save
    dest
  end

  def location_id
    location ? location.id : 0
  end

end

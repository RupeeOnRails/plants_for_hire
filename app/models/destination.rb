class Destination < ApplicationRecord
  belongs_to :location
  belongs_to :next_destination, class_name: 'Destination'

end

class Supplier < ApplicationRecord
  belongs_to :location
  has_one :inventory, as: :owner

end

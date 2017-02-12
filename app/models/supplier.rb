class Supplier < ApplicationRecord
  belongs_to :location
  has_one :inventory, as: :owner


  def inv
    inventory
  end

  def to_s
    name
  end
end

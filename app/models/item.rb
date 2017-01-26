class Item < ApplicationRecord
  def to_s
    self.type
  end
end

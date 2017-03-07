class StockOrder < ApplicationRecord
  belongs_to :merchant, polymorphic: true
  has_many :stock_rules
  
end
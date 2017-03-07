class StockRule < ApplicationRecord
  belongs_to :stock_order
  belongs_to :item
  
end
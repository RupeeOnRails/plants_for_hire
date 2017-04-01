class Merchant < ApplicationRecord
  belongs_to :location
  has_one :stock_order, as: :merchant, dependent: :destroy
  has_many :stock_rules, through: :stock_order
  has_many :contacts, dependent: :destroy
  has_many :players, through: :contacts

  def to_s
    name
  end
  
  def price_for(item)
    stock_rules.find {|rule| rule.item == item}.price
  end

end
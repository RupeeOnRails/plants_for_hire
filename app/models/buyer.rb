class Buyer < Merchant
  def restock
    stock_rules.each do |rule|
      current_restock = if (inventory.number_of_items + rule.restock) < 0
        -1 * inventory.number_of_items
      else
        rule.restock
      end
      inventory.adjust_item rule.item, current_restock
    end
  end
end

class Supplier < Merchant
  def restock
    stock_rules.each do |rule|
      current_restock = if inventory.space <= rule.restock
        inventory.space
      else
        rule.restock
      end
      inventory.adjust_item rule.item, current_restock
    end
  end
end

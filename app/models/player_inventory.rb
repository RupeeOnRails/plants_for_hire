class PlayerInventory < Inventory
  
  def player
    owner
  end

  def size
    player.vehicle.inventory
  end
end

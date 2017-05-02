task :convert_players_inventories_to_player_inventories => :environment do
  count = 0
  Player.all.each do |player|
    i = player.inventory
    unless i.type == 'PlayerInventory'
      i.size = nil
      i.type = 'PlayerInventory'
      if i.save
        count += 1 
      end
    end
  end
  puts "#{count} players' inventories updated"
end

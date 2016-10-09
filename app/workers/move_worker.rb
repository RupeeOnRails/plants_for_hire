class MoveWorker
  include Sidekiq::Worker
  def perform(player_id, location_id)
    puts "Player #{player_id} traveled to location #{location_id}"
    player = Player.find player_id
    location = Location.find location_id
    player.set_location location
    player.destination = nil
    player.save
  end
end

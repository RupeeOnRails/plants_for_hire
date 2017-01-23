class MoveBroadcast
  include Sidekiq::Worker
  def perform(player_id)
    puts "Player #{player_id} finished traveling!"
    event = player_id
    ActionCable.server.broadcast 'play_channel', message: render_event(event)
  end


  private

  def render_event(event)
    ApplicationController.renderer.render('play/broadcast', locals: { event: event })
  end
end

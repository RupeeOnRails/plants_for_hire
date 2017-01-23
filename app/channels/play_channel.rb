# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PlayChannel < ApplicationCable::Channel
  def subscribed
    stream_from "play_channel_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class PlayerController < ApplicationController

  def move
    @location = Location.find params[:location_id]
    @player = current_player
    if @player.location.neighbors.include? @location
      @player.set_destination @location
      render 'move'
    else
      @flash = 'Please select a neighboring location.'
      render 'flash/message'
    end
  end
end

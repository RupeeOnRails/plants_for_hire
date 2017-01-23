class PlayerController < ApplicationController

  def move
    @location = Location.find params[:location_id]
    @player = current_player
    @error = @player.set_destination(@location)
    if !@error
      render 'move'
    else
      @flash = @error
      render 'flash/message'
    end
    # @flash = 'Not enough points.'
    # @flash = 'Please select a neighboring location.'
  end

  def finish_day
    @player = current_player
    @player.reset_points
    @player.set_home_location
  end
end

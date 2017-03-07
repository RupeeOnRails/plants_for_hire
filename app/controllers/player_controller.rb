class PlayerController < ApplicationController

  def move
    @location = Location.find params[:location_id]
    @player = current_player
    @error = @player.set_destination(@location)
    @merchant = if @location.buyers.present?
      @location.buyers.first
    elsif @location.suppliers.present?
      @location.suppliers.first
    end
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
    @player.finish_day
  end

  def buy_from_location
    @player = current_player
    @player.buy
    render 'player/buy'
  end

  def sell_from_location
    @player = current_player
    @player.sell
    render 'player/sell'
  end
end

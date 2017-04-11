class PlayerController < ApplicationController

  def move
    @location = Location.find params[:location_id]
    execute_move
  end

  def finish_day
    @player = current_player
    @player.finish_day
  end

  def buy_from_location
    @player = current_player
    set_merchant
    @location = @player.location
    @player.buy
    render 'player/buy'
  end

  def sell_from_location
    @player = current_player
    set_merchant
    @location = @player.location
    @player.sell
    render 'player/sell'
  end

  def move_left
    @location = current_player.location.left
    execute_move if @location
  end
  def move_up
    @location = current_player.location.up
    execute_move if @location
  end
  def move_right
    @location = current_player.location.right
    execute_move if @location
  end
  def move_down 
    @location = current_player.location.down
    execute_move if @location
  end

  private

  def set_merchant
    location = current_player.location
    @player = current_player
    @merchant = location.merchants.first
    if @merchant
      @contact = current_player.get_or_create_contact_for @merchant
    end
  end

  def execute_move
    @error = current_player.move_to(@location)
    set_merchant
    if !@error
      render 'move'
    else
      @flash = @error
      render 'flash/message'
    end

  end

end

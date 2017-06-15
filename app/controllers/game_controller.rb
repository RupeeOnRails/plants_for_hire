class GameController < ApplicationController
  def play
    @player = current_player
    @location = @player.location
    @merchant = if @location.buyers.present?
      @location.buyers.first
    elsif @location.suppliers.present?
      @location.suppliers.first
    end
    if @merchant
      @contact = @player.get_or_create_contact_for(@merchant)
    elsif @location.upgrade_shop
      @upgrade_shop = @location.upgrade_shop
    end
    @help_text = HelpText.first
  end
end
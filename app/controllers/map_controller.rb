class MapController < ApplicationController

  before_filter :authenticate_player!, :set_locations, :set_paths

  def index
  end

  def list
  end

  def builder
  end

  def update
    @locations.each do |location|
      location.x = params["location_#{location.id}_x_position"]
      location.y = params["location_#{location.id}_y_position"]
      location.save
    end
  end

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

  private

  def set_locations
    @locations = Location.all
  end

  def set_paths
    paths_by_location = Location.all.map {|location| location.paths }.reduce :+
    @paths = paths_by_location.map { |p| p.coordinates }
  end
end

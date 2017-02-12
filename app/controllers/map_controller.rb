class MapController < ApplicationController

  before_filter :set_locations, :set_paths

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
    @player = Player.first
    @location = @player.location
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

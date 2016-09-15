class MapController < ApplicationController
  def index
    @locations = Location.all
  end

  def list
    @locations = Location.all
  end
end

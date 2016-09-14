class MapController < ApplicationController
  def index
  end

  def list
    @locations = Location.all
  end
end

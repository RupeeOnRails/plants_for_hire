class LocationsController < ApplicationController
  def show
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    @location.update location_params
    redirect_to map_path
  end

  private

  def location_params
    params.require(:location).permit(:x_position, :y_position, paths_attributes: [:distance])
  end

end
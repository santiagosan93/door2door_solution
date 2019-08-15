class Api::V1::LocationsController < Api::V1::BaseController
  def create
    @location = Location.new(location_params)
    @location.vehicle = Vehicle.find(params[:id])
    authorize @location
    if @location.save
      ActionCable.server.broadcast 'locations',
        lat: @location.lat,
        lng: @location.lng
      head :no_content
    else
      render_error
    end
  end

  private

  def location_params
    params.require(:location).permit(:lat, :lng, :at)
  end

  def render_error
    render json: { errors: @vehicle.errors.full_messages },
           status: :unprocessable_entity
  end
end

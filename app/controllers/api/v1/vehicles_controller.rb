class Api::V1::VehiclesController < Api::V1::BaseController
  before_action :set_vehicle, only: [:destroy, :show]

  def index
    @vehicles = policy_scope(Vehicle)
  end

  def show
    # gets filled by before_action
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    authorize @vehicle
    if @vehicle.save
      head :no_content
    else
      render_error
    end
  end

  def destroy
    if @vehicle.destroy
      head :no_content
    else
      render_error
    end
  end

  private

  # Written as private for further show, update method implementations.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
    authorize @vehicle
  end

  def vehicle_params
    params.permit(:id)
  end

  def render_error
    render json: { errors: @vehicle.errors.full_messages },
           status: :unprocessable_entity
  end
end

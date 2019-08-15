class LocationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'locations'
    # vehicle = Vehicle.find(params[:id])
    # location = vehicle.locations.last
    # stream_for location
    # puts "#{params[:lat]} im here!"
  end
end

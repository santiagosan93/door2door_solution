json.extract! @vehicle, :id
json.locations @vehicle.locations do |location|
  json.extract! location, :lat, :lng
end

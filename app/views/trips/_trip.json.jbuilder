json.extract! trip, :id, :lat_origin, :long_origin, :lat_destination, :long_destination, :price, :address_origin, :address_destination, :created_at, :updated_at
json.url trip_url(trip, format: :json)

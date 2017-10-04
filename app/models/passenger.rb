require_relative 'trip'
class Passenger < ApplicationRecord
  has_many :trips
  def trips(input_id)
    trips = (Trip.all_trips("passengers"))[input_id.to_i]
    return trips
  end
end

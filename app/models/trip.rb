require_relative 'passenger'
class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
def self.all_trips(input_sort)
  if input_sort == "passengers"
  trips = Trip.order(:date).group_by {|trip| trip.passenger_id}
  return trips
elsif input_sort == "drivers"
  trips = Trip.order(:date).group_by {|trip| trip.driver_id}
  else
    raise ArgumentError.new "Invalid sort parameters"
  end
end
end

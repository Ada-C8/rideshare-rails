class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify

  def total_trip_cost
    trips = Trip.where(passenger_id: self.id).collect { |trip| trip.cost }
    trips.inject { |sum, trip_cost| sum + trip_cost }
  end
end

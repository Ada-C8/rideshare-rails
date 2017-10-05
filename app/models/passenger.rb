class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify

  def total_trip_cost
    costs = trips.collect { |trip| trip.cost }
    costs.inject { |sum, trip_cost| sum + trip_cost }
  end
end

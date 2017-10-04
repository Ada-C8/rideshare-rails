require_relative 'trip'
class Passenger < ApplicationRecord
  has_many :trips
  # def trips(input_id)
  #   trips = (Trip.all_trips("passengers"))[input_id.to_i]
  #   return trips
  # end
  def total_spent
    trips = self.trips
    sum = 0
    trips.each do |trip|
      sum += trip.cost
    end
    return sum
  end

end

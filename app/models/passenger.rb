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
      sum += trip.cost if trip.cost
    end
    return sum
  end

  def current
    trips = self.trips
    trips.each do |trip|
      if trip.rating == nil || trip.cost == nil
        return trip
      end
    end
    return false
  end

end

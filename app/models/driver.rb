require_relative 'trip'
class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
    trips = self.trips
    sum = 0
    trips.each do |trip|
      if trip.cost
        app_cut = trip.cost * (0.15)
        sum += trip.cost - app_cut
      end
    end
    return sum
  end

  def average_rating
    total = 0.0
    trips = self.trips
    trip_count = trips.length
    trips.each do |trip|
      total += trip.rating
    end
    return "#{(total / trip_count).round(2)}"
  end

end

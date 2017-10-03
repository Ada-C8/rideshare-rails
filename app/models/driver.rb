class Driver < ApplicationRecord
  has_many :trips

  def average_rating
    avg = 0
    trips = Trip.where(driver_id: self.id)
    trips.each do |trip|
      avg += trip.rating
    end
    return avg / trips.count
  end
end

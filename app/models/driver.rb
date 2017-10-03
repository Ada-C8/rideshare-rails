class Driver < ApplicationRecord
  has_many :trips

  def self.average_rating(id)
    avg = 0
    trips = Trip.where(driver_id: id)
    trips.each do |trip|
      avg += trip.rating
    end
    return avg / trips.count
  end
end

class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Please enter a name"}
  validates :vin, presence: {message: "Please enter a VIN"}

  def average_rating
    avg = 0
    trips = Trip.where(driver_id: self.id)
    if trips.length == 0
      return 0
    end
    
    trips.each do |trip|
      avg += trip.rating
    end
    return avg / trips.count
  end
end

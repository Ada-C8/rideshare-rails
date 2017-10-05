class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Please enter a name"}
  validates :vin, presence: {message: "Please enter a VIN"}

  def average_rating
    avg = 0
    count = 0

    trips.each do |trip|
      if trip.rating > 0
        count += 1
        avg += trip.rating
      end
    end
    if count == 0
      return 0
    end
    return avg / count
  end

  def total_earnings

    total = 0

    trips.each do |trip|
      total += trip.cost
    end
    total *= 0.85

    return total
  end 
end

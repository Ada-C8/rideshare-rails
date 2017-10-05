class Driver < ApplicationRecord
  has_many :trips

  def total_cost
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost - (trip.cost * 0.15)
    end
    return (sum / 100).to_f.round(2)
  end

  def average_rating
    average = 0
    sum = 0
    self.trips.each do |trip|
      sum += trip.rating
    end
    average = sum / (self.trips.length)
    return average
  end

end

class Driver < ApplicationRecord
  has_many :trips
  def total_earnings
    total_earnings = 0
    self.trips.each do |trip|
      total_earnings += trip.cost
    end
    total_earnings *= 0.85
  end
end

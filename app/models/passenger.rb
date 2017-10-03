class Passenger < ApplicationRecord
  has_many :trips


  def total_cost
    sum = 0
    trips.each do |trip|
      sum += trip.cost
    end
    return sum
  end
  
end

class Driver < ApplicationRecord
  has_many :trip

  validates :name, presence: {message: "Driver needs a name"}
  validates :vin, presence: {message: "Driver needs a VIN number"}

  def total_earned
    total = 0
    trip.each do |x|
      total += x.cost
    end
    return total
  end

  def average_rating
    total = 0.0
    trip.each do |x|
      total += x.rating
    end
    answer = total/trip.length
    return answer.round(2)
  end
end

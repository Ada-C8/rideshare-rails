class Driver < ApplicationRecord
  has_many :trip

  validates :name, presence: {message: "Driver needs a name"}
  validates :vin, presence: {message: "Driver needs a VIN number"}

  def total_earned
    total = 0
    trip.each do |x|
      total += x.cost
    end
    return (total - (total*0.15).round(2))
  end

  def average_rating
    total = 0.0
    count = 0
    trip.each do |x|
      unless x.rating == nil
      total += x.rating
      count += 1
      end
    end
    answer = total/count
    return answer.round(2)
  end
end

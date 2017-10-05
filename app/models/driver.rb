class Driver < ApplicationRecord
  validates :name, presence: { message: "Please enter a name" }
  validates :vin, presence:  {message: "Please enter a VIN" }

  has_many :trips

  def total_amount
    total = 0

    trips.each do |trip|
      total += trip.cost
    end
    return total
  end

  def average_rating
    total = 0

    trips.each do |trip|
      total += trip.rating
    end
    return total / trips.length
  end
end

class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Driver must have a name."}
  validates :vin, presence: {message: "VIN must be entered."}

  def total_earnings
    sum = 0

    trips.each do |trip|
      sum += trip.cost
    end

    return sum - (sum * 0.15)
  end

  def avg_rating
    sum = 0
    if trips > 0
      trips.each do |trip|
        sum += trip.rating
      end
      return (sum/trips.count)
    else
      return 0
    end
  end
end

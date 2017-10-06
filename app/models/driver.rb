class Driver < ApplicationRecord
  # has_many :trips
  has_many :trips, -> { order(date: :desc) }

  validates :name, presence: { message: "You need to provide a name" }
  validates :vin, presence: { message: "You need to provide a VIN number" }

# Calculate total earnings for driver less 15%
  def total_earnings
    total = 0
    trips.each do |trip|
      total += trip.cost
    end
    total_earning = total * (1 - 0.15)
    return "$ #{(total_earning/100).round(2)}"
  end

# Calculate average rating for driver
  def avg_rating
    total_rating = 0
    counter = 0
    trips.each do |trip|
      total_rating += trip.rating
      counter += 1
    end

    if counter == 0
      return "No available average rating"
    else
      return (total_rating / counter)
    end
  end

end

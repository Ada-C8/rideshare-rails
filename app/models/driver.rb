class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :vin, presence: true


def total_earnings
  sum = 0

  trips.each do |trip|
    sum += trip.cost
  end

  sum = (sum * 0.85)

  return sum
end

def average_rating
  rating = 0.0

  counter = 0
  trips.each do |trip|
    if trip.rating == nil
      next
    else
      rating += trip.rating
      counter += 1
    end
  end

  rating /= counter

  return rating

end
end

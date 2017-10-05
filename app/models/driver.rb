class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    total_earnings = trips.inject(0) { |sum, trip| sum + trip.cost }
    total_earnings *= 0.85
  end
  def average_rating
    if trips.length == 0
      return 'No Ratings'
    else
      sum_ratings = trips.inject(0) { |sum, trip| sum + trip.rating }
      average = sum_ratings/(trips.length)
      return average
    end
  end
end

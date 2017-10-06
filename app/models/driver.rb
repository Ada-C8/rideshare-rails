class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  def total_earnings
    total_earnings = trips.inject(0) { |sum, trip| sum + trip.cost }
    total_earnings *= 0.0085
    '%.02f' % total_earnings
  end
  def average_rating
    if trips.length == 0
      return 'No Ratings'
    else
      sum_ratings = trips.inject(0) { |sum, trip| sum + trip.rating }
      average = sum_ratings/(trips.length.to_f.round(1))
      return average
    end
  end
end

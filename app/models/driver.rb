class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :vin, presence: true
  
  def total_earnings
    total_earnings = 0
    self.trips.each do |trip|
      total_earnings += trip.cost
    end
    total_earnings *= 0.85
  end
  def average_rating
    sum_ratings = 0
    self.trips.each do |trip|
      sum_ratings += trip.rating
    end
    if self.trips.length == 0
      return 'No Ratings'
    else
      average = sum_ratings/(self.trips.length)
      return average
    end
  end
end

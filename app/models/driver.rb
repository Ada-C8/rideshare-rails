class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true

  def total_cost
    # TODO: can I use the inject method here instead?
    total_of_trips = []
    trips.each do |trip|
      total_of_trips << trip.cost
    end
    total = ((total_of_trips.sum * (1 - 0.15)) / total_of_trips.length).round(2)
  end

  def rating
    total_ratings = 0
    count = 0
    trips.each do |trip|
      if trip.rating.nil?
      else
      total_ratings += trip.rating
      count += 1
      end
    end
    average = total_ratings/count
  end

end

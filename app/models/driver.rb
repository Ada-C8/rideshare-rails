class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates_presence_of :name, :vin

  def average_rating
    rating = trips.sum { |trip| trip.rating }
    (rating.to_f / trips.length)
  end

  def total_earnings
    earnings = trips.sum { |trip| trip.cost }
    return ((earnings / 100) * 0.85)
  end
end

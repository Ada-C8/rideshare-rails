class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_trip_cost
    costs = trips.collect { |trip| trip.cost }.inject { |sum, trip_cost| sum + trip_cost }
    costs = costs/100.0
    '%.02f' % costs
  end
end

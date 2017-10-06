class Passenger < ApplicationRecord
  # has_many :trips
  has_many :trips, -> { order(date: :desc) }

  validates :date, presence: { message: "You need to provide a date" }
  validates :rating, presence: { message: "You need to provide a rating" }
  validates :cost, presence: { message: "You need to provide a cost" }

  def total_cost
    total_cost = 0
    trips.each do |trip|
      total_cost += trip.cost
    end
    return "$ #{total_cost/100.round(2)}"
  end
end

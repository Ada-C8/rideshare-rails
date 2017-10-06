class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: { message: "You need to provide a name" }
  validates :phone_num, presence: { message: "You need to provide a telephone number" }

  def total_cost
    total_cost = 0
    trips.each do |trip|
      total_cost += trip.cost
    end
    return "$ #{total_cost/100.round(2)}"
  end
end

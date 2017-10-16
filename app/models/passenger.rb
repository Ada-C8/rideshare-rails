class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :phone_number, presence: true

  def total_cost
    sum = 0
    trips.each do |trip|
      if trip.cost == nil
        trip.cost = 0
      end 
      sum += trip.cost
    end
    return sum
  end

end

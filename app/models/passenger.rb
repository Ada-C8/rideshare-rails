class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent
    total = 0.0

    trips.each do |trip|
      total += trip.cost
    end

    total = (total / 100).round(2)
  end
end

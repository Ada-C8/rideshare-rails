class Passenger < ApplicationRecord
  has_many :trips
  # TODO: Add custom validation error messages
  validates :name, presence: true
  validates :phone_number, presence: true

  def total_cost
    # TODO: can I use the inject method here instead?
    total = 0
    trips.each do |trip|
      total += trip.cost
    end # .each
    return (total / 100).round(2)
  end

end

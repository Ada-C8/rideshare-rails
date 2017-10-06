class Passenger < ApplicationRecord
  # has_many :trips
  has_many :trips, -> { order(date: :desc) }

  validates :name, presence: {message: 'Please provide a valid name.'}
  validates :phone_num, presence: {message: 'Please provide a valud phone number.'}

  def total_cost
    total_cost = 0
    trips.each do |trip|
      total_cost += trip.cost
    end
    return "$ #{total_cost/100.round(2)}"
  end
end

class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify
  validates :name, presence: true
  validates :phone_num, presence: true

  def new_trip
    trip = Trip.new(
    driver_id: Driver.where(available: true).sample.id,
    passenger_id: self.id,
    date: Date.today,
    rating: nil,
    cost: rand(1000..5000))

    trips << trip #saving this trip into the has_many trips array

    return trip
  end

  def total_charged
    total_charged = 0
    trips.each do |trip|
      total_charged += trip[:cost]
    end
    return total_charged
  end

end

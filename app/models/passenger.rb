class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, format: {with: /[a-zA-Z]/}
  validates :phone_num, presence: true

  def calculate_total
    all_trips = Trip.where(passenger_id: id)
    sum = 0
    all_trips.each do |trip|
      sum += trip.cost
    end
    return "%.2f" % sum
  end

  def passenger_trips # From Passenger Show Page
    trips = Trip.where(passenger_id: id).order(date: :desc)
    return trips
  end
end

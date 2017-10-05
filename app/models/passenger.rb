class Passenger < ApplicationRecord
  has_many :trips

  def calculate_total
    # @passenger = Passenger.find(params[:id])
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

  validates :name, presence: true, format: {with: /[AZ-az]/}
  validates :phone_num, presence: true
end

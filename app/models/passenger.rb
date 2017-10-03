class Passenger < ApplicationRecord
  has_many :trips

  def calculate_total(id)
    # @passenger = Passenger.find(params[:id])
    all_trips = Trip.where(passenger_id: id)
    sum = 0
    all_trips.each do |trip|
      sum += trip.cost
    end
    return sum
  end
end

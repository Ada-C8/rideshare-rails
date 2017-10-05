class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  # Passenger.find(@trip.passenger_id)
end

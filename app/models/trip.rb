class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :date, presence: { message: "Please choose a date" }
  validates :cost, presence: { message: "Please enter cost" }
  # Passenger.find(@trip.passenger_id)
end

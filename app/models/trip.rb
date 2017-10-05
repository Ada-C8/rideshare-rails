class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
# driver_id, passenger_id, date, rating, cost
  validates :driver_id, presence: {message: "Please select a driver"}
  validates :passenger_id, presence: {message: "Please select a passenger"}
  validates :date, presence: {message: "Please select a date"}
  validates :rating, presence: {message: "Please enter a rating"},
                      numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, message: "Please enter a rating from 1-5 or 0 for no rating"}
  validates :cost, presence: {message: "Please enter the ride cost"},
                      numericality: {only_integer: true, message: "Ride cost should be in cents"}
end

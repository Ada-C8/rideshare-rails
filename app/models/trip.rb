require_relative 'passenger'
class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }, allow_nil: true
  validate :not_currently_on_trip

  def not_currently_on_trip
    if self.passenger.current
      self.errors[:passenger] << "This person is already on a trip. Complete their trip by adding a cost and rating."
    end
  end

# def self.all_trips(input_sort)
#   if input_sort == "passengers"
#   trips = Trip.order(:date).group_by {|trip| trip.passenger_id}
#   return trips
# elsif input_sort == "drivers"
#   trips = Trip.order(:date).group_by {|trip| trip.driver_id}
#   else
#     raise ArgumentError.new "Invalid sort parameters"
#   end
def random_driver
  all_driver_ids = []
  (Driver.all).each do |driver|
    all_driver_ids << driver.id
  end
  all_driver_ids.shuffle!
  return all_driver_ids[0]
end
end

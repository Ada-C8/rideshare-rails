require_relative 'passenger'
class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger


  def validate
    if self.passenger.current
      self.errors[:base] << "This person is already on a trip. "
      return false
    else
      return true
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

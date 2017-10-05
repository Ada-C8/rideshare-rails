class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  def assign_driver
    driver_id = rand(0..Driver.all.length)
    # Double check that we don't need to have the driver object or just the id of the driver
    # How to assign a driver that already has that date taken in the database
    return driver_id
  end
end

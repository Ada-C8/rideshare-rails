class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  def assign_driver
    driver_id = rand(0..Driver.all.length)
    return driver_id
  end
end

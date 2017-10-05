class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :cost, :rating, :date, presence: true
  validates :rating, :cost, numericality: true

  def assign_driver
    driver_id = Driver.all.order("RANDOM()").first.id
    # Double check that we don't need to have the driver object or just the id of the driver
    # How to assign a driver that already has that date taken in the database
    return driver_id
  end

  def has_rating?
    return (rating > 0)
  end
end

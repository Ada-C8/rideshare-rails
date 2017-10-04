class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Passenger must have a name."}
  validates :phone_num, presence: {message: "Phone number is required."}

  def total_charged
    sum = 0
    driver.trips.each do |trip|
      sum += trip.cost
    end
    return sum
  end
end

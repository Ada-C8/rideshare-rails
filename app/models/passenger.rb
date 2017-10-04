class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Please enter a name"}
  validates :phone_num, presence: {message: "Please enter a phone number"}

  def total_spent
    total = 0

    trips.each do |trip|
      total += trip.cost
    end
    return total
  end

end

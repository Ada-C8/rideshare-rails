class Passenger < ApplicationRecord
  validates :name, presence: { message: "Please enter a name" }
  validates :phone_num, presence: { message: "Please enter a phone number" }

  has_many :trips

  def total_amount
    total = 0

    trips.each do |trip|
      # puts "trip : #{trip.cost}"
      total += trip.cost
    end
    return total.round(2)
  end
end

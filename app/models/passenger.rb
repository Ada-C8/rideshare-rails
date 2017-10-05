class Passenger < ApplicationRecord
  has_many :trip
  validates :name, presence: {message: "Passenger needs a name"}
  validates :phone_num, presence: {message: "Passenger needs a phone number"}

  def total_spent
    total = 0
    if trip.length == 0
      total = 0
    else
      trip.each do |x|
        total += x.cost
      end
    end
  return total
  end
end

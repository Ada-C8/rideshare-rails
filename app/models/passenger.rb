class Passenger < ApplicationRecord
  has_many :trip
  validates :name, presence: {message: "Passenger needs a name"}
  validates :phone_num, presence: {message: "Passenger needs a phone number"}

  def total_spent
    total = 0
    trip.each do |x|
      total += x.cost
    end
    return total
  end

end

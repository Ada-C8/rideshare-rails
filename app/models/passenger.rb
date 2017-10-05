class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: { message: "Name cannot be blank!"}
  validates :phone_num, presence: { message: "Phone number cannot be blank!"}

  def total_spent
    total = 0
    trips.each do |trip|
      total += trip.cost
    end
    return total
  end
  
end

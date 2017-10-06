class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: { message: "Name cannot be blank!"}
  validates :vin, presence: { message: "VIN cannot be blank!"}

  def total_money
    total = super.to_f
    total = total - (total * 0.15)
    return '%.2f' % total
  end

  def average_rating
    if trips.any? == false
      return "Nil"
    end
    length = trips.length
    total = 0

    trips.each do |trip|
      if trip.rating
        total += trip.rating
      else
        length -= 1
      end
    end

    total /= length
    return total
  end
end

class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    total = 0
    trips.each do |t|
      total += t.cost
    end
    total = total - (total * 0.15)
    return total
  end

  def average_rating
    total = 0
    counter = 0
    trips.each do |t|
      if t.rating
        total += t.rating
        counter += 1
      end
    end
    total /= counter
    return total.round(1)
  end

end

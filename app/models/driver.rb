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
    trips.each do |t|
      total += t.rating
    end
    total /= trips.count.to_f
    return total.round(1)
  end

end

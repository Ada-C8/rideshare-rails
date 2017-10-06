class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    total = 0
    trips.each do |t|
      total += t.cost
    end
    return (total * 0.85)
  end

  def ave_rating
    total = 0
    trips.each do |t|
      total += t.rating
    end

    average = (total / trips.count)

    return average.round(1)
  end
end

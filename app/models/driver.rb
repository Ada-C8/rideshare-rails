class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    total = 0
    trips.each do |t|
      total += t.cost
    end
    return total
  end

end

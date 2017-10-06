class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :phone_num, presence: true

  def total_charged
    total = 0
    trips.each do |t|
      total += t.cost
    end
    return total
  end
end

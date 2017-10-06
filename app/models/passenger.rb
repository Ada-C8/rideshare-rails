class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: {message: "%{value} must be given"}
  validates :phone_num, presence: {message: "%{value} must be given"}

  def charged
    total_charged = 0
    trips.each do |trip|
      total_charged += trip.cost
    end
    return (Money.new(total_charged, "USD")).format
  end

end

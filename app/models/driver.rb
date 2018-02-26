class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :vin, presence:true, uniqueness: true


  def average_rating
    total = 0.0
    driver_trips = self.trips
    trip_count = driver_trips.length
    driver_trips.each do |trip|
      total += trip.rating
    end
    return "#{(total / trip_count).round(2)}"
  end

  def total_earnings
    total_earnings = 0
    drivers_trips = self.trips
    drivers_trips.each do |trip|
      total_earnings += trip.cost
    end
    return "$ #{sprintf("%.2f",(total_earnings / 100.0 * 0.85))}"
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

end

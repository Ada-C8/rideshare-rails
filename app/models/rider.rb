class Rider < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true

  def total_cost
    #if loop for new riders with no trips, think about proper exception handling instead of returning nil
    if self.trips.count > 0
      total = self.trips.map {|trip| trip.cost}.reduce(:+) / 100.0
      return '%.02f' % total
    else
      return nil
    end
  end

  def start_trip
    if (Driver.available.count).count < 1
      return false #no drivers, no trip!
    else
      picked_driver = Driver.available.sample

      new_trip = Trip.new(rider: self, driver: picked_driver, cost: rand(100..15000), rating: 0, date: Date.today)

      self.trips << new_trip
    end
    return new_trip
  end

end

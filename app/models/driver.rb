class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Please enter a name"}
  validates :vin, presence: {message: "Please enter a VIN"}

  def average_rating
    avg = 0
    count = 0

    trips.each do |trip|
      if trip.rating > 0
        count += 1
        avg += trip.rating
      end
    end
    if count == 0
      return 0
    end
    return avg / count
  end

  def total_earnings

    total = 0

    trips.each do |trip|
      total += trip.cost
    end
    total *= 0.85

    return total
  end

  def self.best_available(date)
    drivers = Driver.by_rating

    drivers.each do |driver|
      return driver if driver.is_available?(date)
    end
  end

  def self.by_rating
    Driver.all.sort_by {|driver| -driver.average_rating}
  end

  def is_available? (date, skiptrip = false)
    if skiptrip
      trips = self.trips.where.not(id: skiptrip)
    else
      trips = self.trips
    end
    return !trips.any?{|trip| trip.date.to_s == date.to_s}
  end

  def trips_by_date
    return trips.order(:date).reverse
  end
end

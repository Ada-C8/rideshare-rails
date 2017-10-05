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
    drivers = Driver.all.sort_by {|driver| -driver.average_rating}

    drivers.each do |driver|
      return driver if driver.is_available?(date)
    end
  end

  def is_available? (date)
    return !trips.any?{|trip| trip.date.to_s == date.to_s}
  end
end

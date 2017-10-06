
class Driver < ApplicationRecord
  has_many :trips

  # must provide a name
  validates :name, presence: {message: "%{value} must be given"}

  # must provide a vin
  validates :vin, presence: {message: "%{value} must be given"}

  def self.select_driver
    return Driver.all.sample
  end

  def average_rating
    sum = 0
    counter = 0
    trips.each do |trip|
      if trip.rating != nil
        sum += trip.rating
        counter += 1
      end
    end
    if sum != 0
      average = sprintf('%.2f', sum.to_f/counter)
    else
      average = nil
    end
    return average
  end

  def total_earnings
    sum = 0
    trips.each do |trip|
      sum += trip.cost
    end
    total_earnings = (0.85 * sum)
    return Money.new(total_earnings, "USD").format
  end
end

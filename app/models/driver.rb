class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, format: {with: /[a-zA-Z]/}
  validates :vin, presence: true

  def total_earning
    trips = Trip.where(driver_id: id)
    sum = 0.00
    trips.each do |trip|
      sum += trip.cost
    end
    return "%.2f" % sum
  end

  def average_rating
    ratings = Trip.where(driver_id: id)
    result = 0
    counter = 0
    ratings.each do |r|
      result += r.rating
      counter += 1
    end
    if counter > 0
      return (result/counter)
    else
      return "no rating"
    end
  end

  def driver_trips # From Driver Show Page
    trips = Trip.where(passenger_id: id).order(date: :desc)
    return trips
  end
end

class Driver < ApplicationRecord
  has_many :trips

  def total_earning
    trips = Trip.where(driver_id: id)
    sum = 0
    trips.each do |trip|
      sum += trip.cost
    end
    return sum
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



end

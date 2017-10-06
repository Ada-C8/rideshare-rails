class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates_presence_of :name, :vin

  def average_rating
    counter = 0
    rating = 0

    trips.each do |trip|
      if trip.rating != nil && trip.rating !=0
        rating += trip.rating
        counter += 1
      end
    end

    return (rating.to_f / counter)
  end


  def total_earnings
    earnings = trips.sum { |trip| trip.cost }
    return (earnings * 0.85)
  end

  def sort_trips(criteria)
    case criteria
    when "date"
      trips.order("date DESC")
    when "cost"
      trips.order("cost DESC")
    end
  end
end

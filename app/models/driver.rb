class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: { message: "You need to provide a name" }
  validates :vin, presence: { message: "You need to provide a VIN number" }

  def avg_rating
    total_rating = 0
    counter = 0
    trips.each do |trip|
      total_rating += trip.rating
      counter += 1
    end

    if counter == 0
      return "No available average rating"
    else
      return (total_rating / counter)
    end
  end
end

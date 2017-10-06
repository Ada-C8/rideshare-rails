class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  def earnings
    @earnings = 0
    trips.each do |trip|
      @earnings += trip.cost
    end
    @earnings *= 0.0085
    return @earnings.round(2)
  end


  def average_rating
    @rating = 0
    @count = 0
    trips.each do |trip|
      if trip.rating?
        @rating += trip.rating
        @count += 1
      end
    end
    @rating /= @count/1.0
    if @count > 0
      return @rating.round(2)
    else
      return "Not Yet Rated!"
    end 
  end
end

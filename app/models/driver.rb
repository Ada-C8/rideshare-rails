class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }

  def total_earned
    total_earned = 0
    self.trips.each do |trip| #trips method returns an array of trips, the method in has_many (can also use self.trips)
      total_earned += trip[:cost]
    end
    return (total_earned - (total_earned * 0.15))
  end

  def average_rating
    average_rating = 0
    counter = 0
    self.trips.each do |trip|
      unless trip[:rating] == nil
      average_rating += trip[:rating]
      counter += 1
      end
    end
    return (average_rating.to_f/counter)
  end

end

class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify
  validates_presence_of :name, :phone_num

  def create_trip
    # self
    # Driver.all.sample
    # Date.current
    # cost = rand(500..2000)

    trip = Trip.new(passenger: self,
      driver: Driver.all.sample,
      date: Date.current,
      cost: rand(5..25),
      rating: 0)

      trips << trip
  end


  def total_cost
    return trips.sum { |trip| trip.cost }
  end

end

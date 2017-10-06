class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :driver_id, presence: { message: "Trip has no driver_id"}
  validates :passenger_id, presence: { message: "Trip has no passenger_id"}
  validates :date, presence: { message: "Date must not be empty!"}
  validates :cost, presence: { message: "Cost must not be empty!"}, numericality: { only_integer: true, greater_than: 0 }
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, :allow_nil => true

  def to_dollars
    return '%.2f' % (self.cost.to_f / 100)
  end

  def to_cents
    return self.cost.to_i * 100
  end

  def get_driver
    return Driver.all.sample.id
  end

  def trip_create(passenger_input)
    self.passenger = Passenger.find(passenger_input)
    self.driver_id = self.get_driver
    self.cost = self.to_cents
    self.rating = nil
  end

end

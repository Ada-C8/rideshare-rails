class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  # do we want validation here for driver/passenger id?
  # do we need to valdate date or will the form do that for us? If we do then how do we do we validate data_type date?
  # rating.... think about it more and ask about state change
  validates :driver_id, presence: { message: "Oh shit trip has no driver_id, fix that"}
  validates :passenger_id, presence: { message: "Oh shit trip has no passenger_id, fix that"}
  validates :date, presence: { message: "Date must not be empty!"}
  validates :cost, presence: { message: "Cost must not be empty!"}, numericality: { only_integer: true, greater_than: 0 }
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, :allow_nil => true

  def to_dollars
    return '%.2f' % (self.cost.to_f / 100)
  end

  def get_driver
    return Driver.all.sample.id
  end

  def to_cents
    return self.cost.to_i * 100
  end

  def trip_create(passenger_input)
    self.passenger = Passenger.find(passenger_input)
    self.driver_id = self.get_driver
    self.cost = self.to_cents
    self.rating = nil
  end

end

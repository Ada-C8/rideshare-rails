class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :cost, :rating, :date, presence: true
  validates :rating, :cost, numericality: true
  validates :cost, numericality: { only_integer: true, greater_than: 0, less_than: 100}

  def assign_driver
    driver_id = Driver.all.order("RANDOM()").first.id
    return driver_id
  end

  def has_rating?
    return (rating > 0)
  end
end

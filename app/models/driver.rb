class Driver < ApplicationRecord
  has_many :trips

  # must provide a name
  validates :name, presence: {message: "%{value} must be given"}

  # must provide a vin
  validates :vin, presence: {message: "%{value} must be given"}

  def self.select_driver
    return Driver.all.sample
  end
end

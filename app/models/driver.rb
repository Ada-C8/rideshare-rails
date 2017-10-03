class Driver < ApplicationRecord
  has_many :trips

  # does anything for driver need to be unique?
  validates :name, presence: { message: "Name cannot be blank!"}
  validates :vin, presence: { message: "VIN cannot be blank!"}
end

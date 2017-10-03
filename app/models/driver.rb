class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Driver must have a name."}
  validates :vin, presence: {message: "VIN must be entered."}
end

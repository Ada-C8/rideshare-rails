class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: { message: "You need to provide a name" }
  validates :vin, presence: { message: "You need to provide a VIN number" }
end

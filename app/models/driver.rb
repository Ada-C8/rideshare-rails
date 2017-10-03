class Driver < ApplicationRecord
  validates :name, presence: { message: "Please enter a name" }
  validates :vin, presence:  {message: "Please enter a VIN" }

  belongs_to :passenger
end

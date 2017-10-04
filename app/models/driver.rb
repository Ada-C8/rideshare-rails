class Driver < ApplicationRecord
  validates :name, presence: { message: "Please enter a name" }
  validates :vin, presence:  {message: "Please enter a VIN" }


end

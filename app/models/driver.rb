class Driver < ApplicationRecord
  has_many :trip

  validates :name, presence: {message: "A Driver must have a name."}
  validates :vin, presence: {message: "A Driver must have a VIN number"}

end

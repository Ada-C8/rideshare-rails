class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "Passenger must have a name."}
  validates :phone_num, presence: {message: "Phone number is required."}
end

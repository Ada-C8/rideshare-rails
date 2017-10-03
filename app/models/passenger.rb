class Passenger < ApplicationRecord
  has_many :trip
  validates :name, presence: {message: "Passenger needs a name"}
  validates :phone_num, presence: {message: "Passenger needs a phone number"}
end

class Passenger < ApplicationRecord
  validates :name, presence: { message: "Please enter a name" }
  validates :phone_num, presence: { message: "Please enter a phone number" }
end

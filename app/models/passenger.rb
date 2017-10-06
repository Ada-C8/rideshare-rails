class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: { message: "Name cannot be blank!"}
  validates :phone_num, presence: { message: "Phone number cannot be blank!"}
end

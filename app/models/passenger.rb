class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: {message: "passenger name is already in our system!"}

  validates :phone_num, presence: true
  # length:  {in: 7..10, message: "Phone number must be between 7-10 digits."}
end

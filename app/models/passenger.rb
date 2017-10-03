class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: {message: "passenger name is already in our system!"}
  validates :phone_num, presence: true
end

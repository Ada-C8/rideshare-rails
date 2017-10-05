class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: { message: "You need to provide a name" }
  validates :phone_num, presence: { message: "You need to provide a telephone number" }
end

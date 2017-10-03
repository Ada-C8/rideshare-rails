class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: {message: "%{value} must be given"}
  validates :phone_num, presence: {message: "%{value} must be given"}
end

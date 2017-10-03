class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates_presence_of :name, :phone_num
end

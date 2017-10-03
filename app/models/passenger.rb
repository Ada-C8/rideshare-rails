class Passenger < ApplicationRecord
  has_many :trips

  validates_presence_of :name, :phone_num
end

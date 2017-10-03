class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
end

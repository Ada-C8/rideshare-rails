class Driver < ApplicationRecord
  # # must provide a name
  # validates :name, presence: true
  #
  # # must provide a vin
  # validates :vin, presence: true

  has_many :trips
end

class Driver < ApplicationRecord
  has_many :trips

  validates_presence_of :name, :vin
end

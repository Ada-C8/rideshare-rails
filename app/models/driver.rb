class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: {message: "driver name is already in our system!"}
  validates :vin, presence: true

  
end

class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }
end

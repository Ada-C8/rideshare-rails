class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: { message: 'Name must contain characters'}
  validates :vin, presence: {message: 'VIN must contain characters'}
end

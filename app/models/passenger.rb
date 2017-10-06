class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: { message: 'Name must contain characters'}
  validates :phone_num, presence: {message: 'Phone number must contain characters'}
end

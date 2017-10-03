class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :phone_num, presence: true
end

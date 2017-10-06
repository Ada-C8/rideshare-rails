class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates :cost, presence: true
  validates :passenger_id, presence: true
  validates :driver_id, presence: true
  validates :rating, presence: true
  validates :date, presence: true
end

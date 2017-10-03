class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true
end

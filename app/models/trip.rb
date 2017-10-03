class Trip < ApplicationRecord
  has_many :passengers
  has_many :drivers
end

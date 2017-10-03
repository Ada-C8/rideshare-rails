class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
end

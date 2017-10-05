class Trip < ApplicationRecord
  belongs_to :driver, required: false
  belongs_to :passenger, required: false
  validates :rating, presence: true
end

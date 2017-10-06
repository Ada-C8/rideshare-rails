class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6, allow_nil: true, message: 'Rating must be an integer between 1 and 5'}
  validates :cost, numericality: { only_integer: true, greater_than: 0, message: 'Cost must be a positive integer' }
end

class Trip < ApplicationRecord
  belongs_to :driver

  belongs_to :passenger, optional: true

  validates :rating, numericality: { only_integer: true, allow_nil: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0, message: "Rating must be a number between 0-5." }


end

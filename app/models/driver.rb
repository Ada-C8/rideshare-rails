class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true
  # validates :description, length {maximum: 500}
  # validates :name, uniqueness: { message: "This is your custom error message" }
  # you can add a uniqeness, format, length, numericality validation
  # each field gets a separate line, but each line can have multiple validations.
end

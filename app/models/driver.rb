class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true
  # validates :description, length {maximum: 500}
  # validates :name, uniqueness: { message: "This is your custom error message" }
  # you can add a uniqeness, format, length, numericality validation
  # each field gets a separate line, but each line can have multiple validations.

  def total_earned
    total = 0.0

    trips.each do |trip|
      total += trip.cost
    end

    total = ((total * 0.85) / 100).round(2)
    #pretty sure this wont give .00 cents but its good enough for now
  end
end

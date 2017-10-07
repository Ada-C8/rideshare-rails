class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: { message: "You need to provide a date" }
  validates :rating, presence: { message: "You need to provide a rating" }
  validates :cost, presence: { message: "You need to provide a cost" }
end

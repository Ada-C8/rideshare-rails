class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating, presence: {message: "Trip needs rating from 1 to 5."}
end

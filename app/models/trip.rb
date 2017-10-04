class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates :rating, presence: true
  validates :cost, presence: true

end

class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates :cost, presence: true
  # validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5  }
end

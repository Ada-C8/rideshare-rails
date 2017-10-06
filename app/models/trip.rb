class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates :cost, presence: true
  validates :rating, numericality:  {only_integer: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }


end

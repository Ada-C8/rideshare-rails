class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates_inclusion_of :rating, in: 1..5, :allow_nil => true
end

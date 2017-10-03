class Rider < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone, presence: true
end

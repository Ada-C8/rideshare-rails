class Rider < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true

  def total_cost
    total = self.trips.map {|trip| trip.cost}.reduce(:+).to_f / 100
    return '%.02f' % total
  end
end

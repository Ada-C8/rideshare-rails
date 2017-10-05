class Rider < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true

  def total_cost
    #if loop for new riders with no trips, think about proper exception handling instead of returning nil
    if self.trips.count > 0
      total = self.trips.map {|trip| trip.cost}.reduce(:+) / 100.0
      return '%.02f' % total
    else
      return nil
    end
  end
end

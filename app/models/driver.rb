class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  COMMISSION = ".85".to_f

  def total_earnings
    total_charges= self.trips.map{|trip| trip.cost}.reduce(:+)

    return '%.02f' % (total_charges * COMMISSION)
  end

  def avg_rating
    avg = self.trips.map { |trip| trip.rating}.reduce(:+).to_f / self.trips.count
    return '%.01f' % avg
  end
end

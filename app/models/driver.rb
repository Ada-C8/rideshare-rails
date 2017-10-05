class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :vin, presence: true

  COMMISSION = ".85".to_f

  def total_earnings
    # if loop is for new drivers who don't have any trips, and therefore have no trip costs to add to earnings
    #think about proper exception handling instead of returning nil
    if self.trips.count > 0
      total_charges= (self.trips.map{|trip| trip.cost}.reduce(:+))/100.0

      #rounds up to nearest cent
      return '%.02f' % (total_charges * COMMISSION)
    else
      return nil
    end
  end

  def avg_rating
    count = self.trips.select{|trip| trip.rating > 0}.count
    avg = self.trips.map { |trip| trip.rating}.reduce(:+).to_f / count
    return '%.01f' % avg if avg > 0 
  end
end

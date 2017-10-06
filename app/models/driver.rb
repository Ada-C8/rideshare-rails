class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: true
  validates :vin, presence: true

  COMMISSION = ".85".to_f

  def total_earnings
    if self.trips.count > 0
      total_charges= (self.trips.map{|trip| trip.cost}.reduce(:+))/100.0

      return '%.02f' % (total_charges * COMMISSION)
    else
      return nil
    end
  end

  def avg_rating
    count = self.trips.select{ |trip| trip.rating > 0 }.count
    avg = self.trips.map { |trip| trip.rating}.reduce(:+).to_f / count
    return '%.01f' % avg if avg > 0
  end

  def self.available #This is dummy logic for practice where driver can only have one rider per date
    self.joins(:trips).merge(Trip.having('MAX(date) < ?', Date.today).group(:id))
  end
end

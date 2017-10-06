class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent
    total = 0.0

    trips.each do |trip|
      total += trip.cost
    end


    total = '%.2f' % [total/100.0]
  end
end

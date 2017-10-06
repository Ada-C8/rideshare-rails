class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def total_money
    total = 0
    trips.each do |trip|
      total += trip.cost
    end
    return '%.2f' % (total.to_f / 100)
  end
end

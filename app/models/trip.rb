class Trip < ApplicationRecord

  belongs_to :driver
  belongs_to :passenger

  # This makes it so the cost will display in decimal form (12.34 vs 1234) in the edit form
  def cost_in_dollars
    return (self.cost.to_f / 100).round(2)
  end # cost_in_dollars

# TODO: figure out why this is rounding down 50.55 to 50.0 
  def remove_decimal_from_cost
    return (self.cost.to_f * 100)
  end

  validates_presence_of :driver
  validates_presence_of  :passenger
  validates_presence_of  :driver_id
  validates_presence_of :passenger_id
  validates_presence_of :date
  validates_presence_of  :cost

end

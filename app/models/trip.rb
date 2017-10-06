class Trip < ApplicationRecord

  belongs_to :driver
  belongs_to :passenger


  validates_presence_of :driver_id
  validates_presence_of :passenger_id
  validates_presence_of :date
  validates_presence_of :cost
  validates :rating, allow_nil: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}



  # validates_inclusion_of :rating, :in => 0..5


  # TODO: make this method work later!
  # def cost_in_dollars
  #   trip = trips.find(params[:id])
  #   return (trip.cost / 100).round(2)
  # end # cost_in_dollars

  # This makes it so the cost will display in decimal form (12.34 vs 1234) in the edit form
  def cost_in_dollars
    return (self.cost.to_f / 100).round(2)
  end # cost_in_dollars

# TODO: figure out why this is rounding down 50.55 to 50.0
  def set_cost_in_dollars(cost_dollars)
    puts "In cost_dollars, cost_dollars is #{cost_dollars}"
    self.cost = cost_dollars.to_f * 100
  end

end

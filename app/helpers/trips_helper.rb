module TripsHelper
  def cost_with_decimal(trip)
    trip.cost/100.0
  end
end

module TripsHelper
  def trip_needs_driver
    needs_driver = []
    (Trip.all).each do |trip|
      needs_driver << trip if trip.driver == nill
    end
    if needs_driver.empty?
      return false
    else
      return needs_driver
    end
  end

end

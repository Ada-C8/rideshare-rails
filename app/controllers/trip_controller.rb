class TripController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id].to_i)

    unless @trip
      redirect_to passengers_path
    end

    @passenger = @trip.passenger
    @driver = @trip.driver
  end
end

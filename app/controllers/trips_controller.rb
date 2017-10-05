class TripsController < ApplicationController
  # def index
  #   if params[:driver_id]
  #     @trips = Driver.find(params[:driver_id]).trips.order(date: :desc)
  #   else
  #     @trips = Trip.all.order(date: :desc)
  #   end
  # end


  def show
    @trip = Trip.find(params[:id])
  end

end

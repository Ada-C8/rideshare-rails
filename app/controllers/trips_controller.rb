class TripsController < ApplicationController
  def index
    @trips = Trip.where(params[:driver_id])
  end

  def show
    @trip = Trip.find(params[:id])
  end
end

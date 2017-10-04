class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @trips = Driver.find(params[:driver_id]).trips
    elsif params[:passenger_id]
      @trips = Passenger.find(params[:passenger_id]).trips
    else
      @trips = Trip.all
    end
  end

  def new
  end

  def create
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to root_path
  end
end

class TripsController < ApplicationController

  def index
    @trips = Trip.order(:id)
  end

  def show
    @trip = Trip.find_by(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create

  end 

  def edit
    @trip = Trip.find_by(params[:id])
  end

  def update_trip

  end

  def delete
    trip = Trip.find_by(params[:id])

    if trip.destroy
      redirect_to trips_path
    else

    end
  end


end

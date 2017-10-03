class TripsController < ApplicationController
  def index
    @trips = Trips.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
    @passenger = Passenger.find_by(id: @trip.passenger_id.to_i)
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end

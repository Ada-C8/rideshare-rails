class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to('/trips')
    else
      render :new
    end
  end

  def show
    # @passenger.trip
    # Trip.where(passenger_id)
    @trip = Trip.find(params[:id])
  end


end

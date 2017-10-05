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
    # @passenger = Passenger.find(params[:passenger_id])
    @trip = Trip.new
    @trip.passenger = Passenger.find(params[:passenger_id])
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.passenger = Passenger.find(params[:passenger_id])
    # @passenger = Passenger.find(params[:passenger_id])
    if @trip.save
     redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
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

  private

  def trip_params
    # params.require(:passenger).require(:trip)
    return params.require(:trip).permit(:date, :cost, :driver_id, :passenger_id, :cost)
  end
end

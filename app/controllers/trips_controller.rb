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
    @trip = Trip.new
    @trip.passenger = Passenger.find(params[:passenger_id])
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.passenger = Passenger.find(params[:passenger_id])
    @trip.default_values
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
    @trip = Trip.find(params[:id])
    @trip.cost = @trip.to_dollars
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    @trip.cost = @trip.to_cents
    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to root_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :cost, :driver_id, :passenger_id, :cost, :rating)
  end
end

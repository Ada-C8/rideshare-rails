class TripsController < ApplicationController
  def index
    # CHECK IF NEEDED
    # @trips = Trip.where(params[:driver_id])
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to trips_path
  end

  def new
    @trip = Trip.new
    if params[:passenger_id]
      @trip.passenger_id = params[:passenger_id]
    end
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id)
  end
end

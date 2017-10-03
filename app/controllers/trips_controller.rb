class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(
    trips_params
    )
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  private
  def trips_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  end
end

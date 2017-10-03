class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
    redirect_to trips_path unless @trip
  end

  def update
    trip = Trip.find_by(id: params[:id])
    redirect_to trips_path unless trip

    trip.update_attributes(trip_params) ? (redirect_to trip_path) : (render :edit)
  end

  def new

  end

  def create

  end

  def destroy

  end

  private
  def trip_params
    return params.require(:trip).permit(:rating)
  end
end

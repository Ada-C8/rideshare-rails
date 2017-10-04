class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    redirect_to edit_trip_path unless @trip

    if @trip.update_attributes trip_params
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    Trip.find_by(id: params[:id]).destroy

    redirect_to trips_path
  end

  private
    def trip_params
      return params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
    end
end

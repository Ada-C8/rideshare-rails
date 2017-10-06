class TripsController < ApplicationController

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

  def destroy
    if Trip.find_by(id: params[:id]).destroy
      flash[:notice] = "Trip deleted"
      redirect_to root_path
    end
  end

  private
  def trip_params
    return params.require(:trip).permit(:rating)
  end
end

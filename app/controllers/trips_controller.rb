class TripsController < ApplicationController
  def index
    #are we goign to use this??
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def create
  end

  def update
    @trip = Trip.find_by(id: params[:id])

    if @trip.update_attributes(trip_params)
      flash[:notice] = "Trip updated"
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy

    redirect_to trips_path
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def new
  end

  private

  def trip_params
    # permitting edit passenger to practice updating through a join
    return params.require(:trip).permit(:rating, :passenger_id)
  end
end

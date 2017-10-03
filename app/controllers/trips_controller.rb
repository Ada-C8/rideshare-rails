class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def create

  end

  def new

  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    result = @trip.update(trip_params)

    if result
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :rating, :cost)
  end
end

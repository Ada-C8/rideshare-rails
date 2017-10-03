class TripsController < ApplicationController

def index
  @trips = Trip.all
end

def show
  @trip = Trip.find(params[:id])
end

def update
  @trip = Trip.find(params[:id])
  @trip = Trip.update(trip_params)
  @trip.save

  redirect_to trip_path(@trip)
end

private

def trip_params #may need to update this later depending what we want to allow to be updated
  return params.require(:trip).permit(:driver, :passenger)
end

end

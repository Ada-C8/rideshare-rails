class TripsController < ApplicationController

def index
  @trips = Trip.all
end

def show
  @trip = Trip.find(params[:id])
end

def edit
  @trip = Trip.find(params[:id])
end

def update
  @trip = Trip.find(params[:id])
  @trip.update(trip_params)
  @trip.save

  redirect_to trip_path(@trip)
end

private

def trip_params
  return params.require(:trip).permit(:rating, :cost)
end

end

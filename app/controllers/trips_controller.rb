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
  @trip.update_attributes(trip_params)
  if @trip.save
    redirect_to trip_path(@trip)
  else
    render :edit
  end
end

private

def trip_params #may need to update this later depending what we want to allow to be updated
  return params.require(:trip).permit(:driver, :passenger)
end

end

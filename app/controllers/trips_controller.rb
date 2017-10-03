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

  def new

  end

  def update

  end

  def destroy

  end
end

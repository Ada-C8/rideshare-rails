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
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy

    redirect_to trips_path
  end

  def edit
  end

  def new
  end
end

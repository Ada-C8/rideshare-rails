class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger)
  end
end

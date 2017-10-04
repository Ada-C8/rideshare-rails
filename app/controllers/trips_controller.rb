class TripsController < ApplicationController
  def index
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)

    unless @trip
      redirect_to passenger_trips_path
    end
  end

  def update
    trip = Trip.find_by(id: params[:id].to_i)
    redirect to passenger_trips_path unless trip

    if trip.update_attributes passenger_params
      redirect_to passenger
    else
      render :edit
    end
  end

  def create
  end

  def destroy
  end
end

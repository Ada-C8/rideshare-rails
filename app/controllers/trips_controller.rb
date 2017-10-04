class TripsController < ApplicationController
  def index
    if params[:passenger_id] != nil
      @trips = Trip.where(passenger_id: params[:passenger_id])
    else
      @trips = Trip.all
    end
  end

  def new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
    Trip.find_by(id: params[:id]).destroy
    redirect_to passenger_path
  end
end

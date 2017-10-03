class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(
    driver_id: params[:trip][:driver_id],
    passenger_id: params[:trip][:passenger_id],
    date: params[:trip][:date],
    cost: params[:trip][:cost],
    rating: params[:trip][:rating]
    )
    if @trip.save
    redirect_to trips_path
    else
      render :new
    end
  end
end

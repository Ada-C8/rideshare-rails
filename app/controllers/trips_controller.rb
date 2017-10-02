class TripsController < ApplicationController

  def index
    @trips = Trip.order(:id)
  end

  def show
    @trip = Trip.find_by(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(name: params[:trip][:name], phone_number: params[:passenger][:phone_number])
    if @trip.save
      redirect_to passenger_index_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(params[:id])
  end

  def update_trip

  end

  def delete
    trip = Trip.find_by(params[:id])

    if trip.destroy
      redirect_to trips_path
    else

    end
  end


end

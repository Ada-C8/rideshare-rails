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
    @trip = Trip.new
    passenger = Passenger.find_by(id: params[:passenger])
    @trip.passenger = passenger
    @trip.driver = Driver.all.sample
    @trip.date = Date.today.to_s
    @trip.cost = 1000

    if @trip.save
      redirect_to passenger_path(params[:passenger])
    end
  end

  def edit_rating
    @trip = Trip.find_by(id: params[:id])
  end

  def update_rating

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

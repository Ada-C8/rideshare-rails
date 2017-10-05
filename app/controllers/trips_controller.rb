class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
    @passenger = Passenger.find_by(id: @trip.passenger_id.to_i)
  end

  def edit
  end

  def update
  end

  def new
    @trip = Trip.new(driver_id: Driver.all.sample.id, passenger_id: params[:pass_id], date: Date.today, rating: nil, cost: rand(10..50) )
  end

  def create

  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

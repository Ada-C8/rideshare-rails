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
    trip = Trip.new(
      driver_id: Driver.all.sample.id,
      passenger_id: Passenger.find(params[:id]).id,
      date: Date.today,
      cost: rand(10..100),
      rating: 0
    )
    trip.save!
    # puts @trip.errors.inspect
    # if trip.save
    #   redirect_to trips_path
    # else
    #   render :new
    # end
  end

  private
  def trips_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  end
end

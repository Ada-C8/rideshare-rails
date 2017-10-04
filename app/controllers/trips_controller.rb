class TripsController < ApplicationController
  def index
  end

  def show
  end

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    create
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def driver_select
    answer = Driver.find(rand(1..Driver.all.length)).id
    puts "driver id #{answer}"
    return answer
  end

  def create
    driver = driver_select 
    cost = rand(1000..5000)
    trip = Trip.new(passenger_id: 2, cost: cost, driver_id: driver, rating: nil, date: Date.today)
    trip.save
    puts "I am saving"
    redirect_to trips_path
  end

  def update
    strong_params = trip_params
    @trip = Trip.find(params[:id])
    @trip.update_attributes(strong_params)
    # @passenger.name = params[:passenger][:name]
    # @passenger.phone_num = params[:passenger][:phone_num]
    @trip.save
    redirect_to trip_path
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to trips_path
  end
  #YOU DIANE
  #def show def new def create def edit def update def destroy

  private
  def trip_params
    return params.require(:trip).permit(:passenger_id, :rating)
  end



  #def show def new def create def edit def update def destroy
end

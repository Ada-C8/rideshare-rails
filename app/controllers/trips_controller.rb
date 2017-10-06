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
    # **** TRIED TO ADD if params[:id]
    # @trip = Trip.new
    # if params[:id]
    #   @trip.passenger_id = params[:id]
    # end
    # @trip.save
    # ***********
    #create #Is this ok?, if not, how do we get the passenger id into create
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
    passenger_id = params[:id]
    #@trip.passenger_id
    # ************ TOOK OUT PASSENGER ID??
    trip = Trip.new(passenger_id: passenger_id, cost: cost, driver_id: driver, rating: nil, date: Date.today)
    # ************
    trip.save
    redirect_to trip_path(trip.id)
  end

  def update

    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    # @passenger.name = params[:passenger][:name]
    # @passenger.phone_num = params[:passenger][:phone_num]
    @trip.save
    redirect_to trip_path
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to trips_path
    #passenger_path(trip.passenger_id)
  end

  private
  def trip_params
    return params.require(:trip).permit(:passenger_id, :rating, :cost)
  end


  #def show def new def create def edit def update def destroy
end

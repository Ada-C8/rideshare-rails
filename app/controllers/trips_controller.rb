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

  def new(passenger)
    @trip = Trip.new
    create(passenger)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    # strong_params = trip_params
    #TRIED TO MAKE DEFAULT RATING O DOWN THERE
    trip = Trip.new(passenger.id)
    trip.save
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

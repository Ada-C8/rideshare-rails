class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trip.passenger_id = params[:passenger_id]
    # @trip.driver_id = 1

  end

  def create
    @trip = Trip.new(trip_params)
    @drivers = Driver.all

    if @drivers.length > 0
      d =  @drivers.shuffle.first
      @trip.driver_id = d.id
    else
      redirect_to root_path
    end

    if @drivers.length > 0
      d =  @drivers.shuffle.first
      @trip.driver_id = d.id
    end

    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip_updates = params[:trip]
    @trip = Trip.find(params[:id])

    @trip.rating = trip_updates[:rating]

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to root_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:date, :cost, :passenger_id, :driver_id)
  end
end

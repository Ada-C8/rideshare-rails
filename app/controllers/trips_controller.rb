class TripsController < ApplicationController
  def index
    if params[:id]
      @trips = Passenger.find_by(id: params[:id]).trips
    else
      @trips = Trip.all
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
    if params[:id]
      @trip.passenger_id = params[:id]
    end
    @trip.driver_id = Driver.where(available: true).sample.id
    @trip.date = Date.today
    @trip.rating = nil
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    redirect_to edit_trip_path unless @trip

    if @trip.update_attributes trip_params
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    Trip.find_by(id: params[:id]).destroy

    redirect_to trips_path
  end

  private
    def trip_params
      return params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
    end
end

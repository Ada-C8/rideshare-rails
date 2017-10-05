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
    @trip = Trip.find_by(id: params[:id])

    @trip.rating = params[:trip][:rating].to_i
    @trip.save
    passenger = Trip.find(@trip.id).passenger

    redirect_to passenger_path(passenger.id)

  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.update_attributes(trip_params)

    if @trip.save
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    passenger_id = Trip.find_by(id: params[:id]).passenger.id
    Trip.find_by(id: params[:id]).destroy
    redirect_to passenger_path(passenger_id)
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :driver_id, :rating)
  end
end

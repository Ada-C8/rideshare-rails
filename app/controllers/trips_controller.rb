class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
    redirect_to trips_path unless @trip
  end

  def update
    trip = Trip.find_by(id: params[:id])
    redirect_to trips_path unless trip

    trip.update_attributes(trip_params) ? (redirect_to trip_path) : (render :edit)
  end

  # def new
  #   @trip = Trip.new
  # end

  def create
    rider_passed_in = Rider.find_by(id: params[:id])
    @trip = Trip.new(rider: rider_passed_in, driver: Driver.all.sample, cost: rand(100..15000), rating: 0, date: Date.today)
    #later logic: driver would be next available & cost would be based on something
    @trip.save ? (redirect_to trip_path(@trip.id)) : (redirect_to rider_path(params[:id]))
  end

  def destroy
    redirect_to trips_path if Trip.find_by(id: params[:id]).destroy
  end

  private
  def trip_params
    return params.require(:trip).permit(:rating)
  end
end

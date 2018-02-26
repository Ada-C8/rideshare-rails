class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
  end

  def edit
  end

  def create
    @trip =Trip.new(cost: rand(100...10000), rating: 0, date: Date.today, driver_id: Driver.ids.sample, passenger_id: params[:pax_id])
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
  end


  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to passenger_path(@trip.passenger_id)
  end

  private

  def find_trip
    @trip= Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:cost, :rating, :driver_id, :passenger_id)
  end

end

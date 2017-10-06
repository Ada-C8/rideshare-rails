class TripsController < ApplicationController

  def show
    @trip = Trip.find(params[:id])
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to "/"
  end

  def new
    @trip = Trip.new
    if params[:passenger_id]
      @trip.passenger_id = params[:passenger_id]
    end
    @trip.driver_id = Driver.select_driver.id
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    if params[:passenger_id]
      @trip.passenger_id = params[:passenger_id]
    end
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
  end
end

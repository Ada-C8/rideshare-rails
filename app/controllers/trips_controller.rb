class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    if params[:id]
      @trip.passenger_id = params[:id]
    end
    @trip.driver_id = @trip.assign_driver
  end

  def create
    params[:trip][:rating] = 0 # Set Rating to a default of 0
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    result = @trip.update_attributes(trip_params)

    if result
      redirect_to trip_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    result = trip.destroy

    if result
      redirect_to root_path
    else
      redirect_to trip_path(params[:id])
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :cost, :rating, :date)
  end
end

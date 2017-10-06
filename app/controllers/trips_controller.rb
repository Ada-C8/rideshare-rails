class TripsController < ApplicationController

  def home
    @homepage = true
  end

  def index
    @trips = Trip.order(:id)
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new(passenger_id: params[:passenger_id])
  end

  def create
    @drivers = Driver.order(:id)
    @trip = Trip.new(date: params[:trip][:date], passenger_id: params[:trip][:passenger_id], cost: params[:trip][:cost], driver_id: @drivers.assign_driver)

    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
    unless @trip
      redirect_to trip_index_path
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    result = @trip.update({rating: params[:trip][:rating]})
    if result
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    if trip.destroy
      redirect_to trip_index_path
    end
  end

  private

  def passenger_params
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
  end

end

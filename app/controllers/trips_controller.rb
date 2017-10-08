class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
    @passenger = Passenger.find_by(id: @trip.passenger_id.to_i)
    @driver = Driver.find_by(id: @trip.driver_id.to_i)
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
    unless @trip
      redirect_to trip_path
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    redirect_to trip_path unless @trip
    if @trip.update_attributes trip_params
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def new


    @trip = Trip.new(driver_id: Driver.where(available: true).sample.id, passenger_id: params[:pass_id], date: Date.new, rating: nil, cost: rand(10..50) )
  end

  def create
    @trip = Trip.new(driver_id: params[:trip][:driver_id], passenger_id: params[:trip][:passenger_id], date: params[:trip][:date], rating: params[:trip][:rating], cost: params[:trip][:cost] )

    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def destroy
    Trip.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    # puts ">>> DPR in trip#new, params[:id] is #{params[:id]}"
    if params[:id]
      @trip.passenger_id = params[:id]
    end
    @trip.driver_id = @trip.assign_driver
  end

  def create
    @trip = Trip.new(
    driver_id: params[:trip][:driver_id], # Call a method to the Driver db to assign the driver id to here
    passenger_id: params[:trip][:passenger_id],
    date: params[:trip][:date],
    rating: 0,
    cost: params[:trip][:cost]
    )
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
    result = @trip.update(rating: params[:trip][:rating])

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
      redirect_to trips_path
    else
      redirect_to trip_path(params[:id])
    end
  end

  private

end

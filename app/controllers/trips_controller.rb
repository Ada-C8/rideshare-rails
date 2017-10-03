class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(
    driver_id: params[:trip][:driver_id],
    passenger_id: params[:trip][:passenger_id],
    date: params[:trip][:date],
    rating: params[:trip][:rating],
    cost: params[:trip][:cost]

    )
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    result = @trip.update(
    driver_id: params[:trip][:driver_id],
    passenger_id: params[:trip][:passenger_id],
    date: params[:trip][:date],
    rating: params[:trip][:rating],
    cost: params[:trip][:cost]
    )
    if result
      redirect_to trip_path(params[:id])
    else
      render :edit
    end
  end

  # def destroy
  #   trip = Trip.find(params[:id])
  #   result = trip.destroy
  #   if result
  #     redirect_to trips_path
  #   else
  #     redirect_to trip_path(params[:id])
  #   end
  # end

  private

end

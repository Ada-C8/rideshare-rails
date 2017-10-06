class TripsController < ApplicationController
  def index
    if params[:passenger_id] != nil
      @trips = Trip.where(passenger_id: params[:passenger_id])
      @trip_show_route = passenger_trips_url
    elsif params[:driver_id] != nil
      @trips = Trip.where(driver_id: params[:driver_id])
      @trip_show_route = driver_trips_url
    else
      @trips = Trip.all
      @trip_show_route = trips_url
    end
  end

  def new
    @trip = Trip.new
  end

  def show
    if params[:passenger_id] != nil
      @trip = Trip.find_by(passenger_id: params[:passenger_id], id: params[:id])
      @trip_edit_path = passenger_trips_url
    elsif params[:driver_id] != nil
      @trip = Trip.find_by(driver_id: params[:driver_id], id: params[:id])
    else
      @trip = Trip.find(params[:id])
      @trip_edit_path = trips_url
    end
  end

  def edit
    if params[:passenger_id] != nil
    @trip = Trip.find_by(passenger_id: params[:passenger_id], id: params[:id])
    else
    @trip = Trip.find(params[:id])
    end

    unless @trip
      redirect_to passenger_trips_path
    end
  end

  def update
    trip = Trip.find_by(id: params[:id].to_i)
    redirect to passenger_trips_path unless trip

    if trip.update_attributes trip_params
      redirect_to trip
    else
      render :edit
    end
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip
    else
      render :new
    end
  end

  def destroy
    Trip.find_by(id: params[:id]).destroy
    redirect_to passenger_path
  end

  private

  def trip_params
    params.require(:trip).permit(:passenger_id, :driver_id, :date, :rating, :cost)
  end
end

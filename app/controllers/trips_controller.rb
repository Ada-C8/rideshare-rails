class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)

  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    redirect_to trips_path unless @trip
    @trip.rating = params[:trip][:rating].to_i if [1..5].include? params[:trip][:rating].to_i
    @trip.cost = params[:trip][:cost].to_f
    if @trip.save
      flash[:notice] = "Trip #{@trip.id} was successfully updated"
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def new
    @trip = Trip.new
    @passenger = Passenger.find(params[:passenger].to_i)    
    @trip.passenger_id = @passenger.id
    @trip.driver_id = @trip.random_driver
    if @trip.save
      flash[:notice] = "Trip #{@trip.id} was successfully saved"
      redirect_to passenger_path(@passenger.id)
    else
      # something
    end
  end

  def create
  end

  def destroy
    @trip = Trip.find_by(id: params[:id].to_i)
    trip_id = @trip.id
    if @trip.destroy
      flash[:notice] = "#{trip_id} was successfully deleted, bye!"
      redirect_to passengers_path
    else
      render :index
    end
  end
end

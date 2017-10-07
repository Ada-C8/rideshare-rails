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
    @trip.rating = params[:trip][:rating].to_i
    @trip.cost = params[:trip][:cost].to_f
    if @trip.save
      flash[:notice] = "Trip #{@trip.id} was successfully updated"
    else
      flash[:notice] = "#{@trip.errors[:passenger][0]} "
    end
    redirect_to passenger_path(@trip.passenger.id)
  end

  def new
    @trip = Trip.new
    @passenger = Passenger.where(id: params[:passenger].to_i)[0]
    @trip.passenger_id = @passenger.id
    @trip.driver_id = @trip.random_driver
    if @trip.save
      flash[:notice] = "Trip #{@trip.id} was successfully saved"
    else
      flash[:notice] = "#{@trip.errors[:passenger][0]} "
    end
    redirect_to passenger_path(@passenger.id)
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

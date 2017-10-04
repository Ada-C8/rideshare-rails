class TripsController < ApplicationController
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to('/trips')
    else
      render :new
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    if @trip.save
      redirect_to(trip_path(@trip))
      #redirect_back(fallback_location: trip_path(@trip))
    else
      render :new
    end
  end

  private
   def trip_params
     return params.require(:trip).permit(:date, :rating, :driver_id, :passenger_id, :cost)
   end
end

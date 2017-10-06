class TripsController < ApplicationController
  def index
    if params[:passenger_id]
      @trips = Passenger.find(params[:passenger_id]).trips
    else
      @trips = Trip.all.order('date desc')
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.cost = @trip.to_cents

    @trip.save




    if @trip.save
      redirect_to('/trips')
    else
      render :new
    end

  end

  def new
    @trip = Trip.new
    if params[:passenger_id]
      @trip.passenger_id = params[:passenger_id]
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    @trip.cost = @trip.to_cents
    if @trip.save
      redirect_to(trip_path(@trip))
      # redirect_back(fallback_location: @trip)
    else
      render :new
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_path
    # redirect_back(fallback_location: trips_path)

  end

  private
    def trip_params
      return params.require(:trip).permit(:date, :rating, :driver_id, :passenger_id, :cost)
    end

end

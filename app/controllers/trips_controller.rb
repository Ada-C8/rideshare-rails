class TripsController < ApplicationController
  def index
    if params[:id]
      @trips = Passenger.find(params[:id]).trips
    else
      @trips = Trip.order(:id)
    end
  end

  def new
    @trip = Trip.new
    if params[:passenger_id]
      @trip.passenger_id = params[:passenger_id]
    end
  end

  def create
    @trip = Trip.new(trips_params
    )
    if @trip.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  #   @trip = Trip.find(params[:id])
  # end
  def show
    @trip = Trip.find_by(id: params[:id].to_i)

    unless @trip
      redirect_to root_path
    end

    # @passenger = @trip.passenger
    # @driver = @trip.driver
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    result = @trip.update(trips_params)
    if result
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    if trip.destroy
      redirect_to trips_path
    else
      #error message
    end
  end

  private

  def trips_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  end
end

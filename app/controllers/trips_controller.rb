class TripsController < ApplicationController
  def index
    @trips = Trip.order(:id)
  end

  # def show
  #   @trip = Trip.find(params[:id])
  # end
  def show
    @trip = Trip.find_by(id: params[:id].to_i)

    unless @trip
      redirect_to root_path
    end

    @passenger = @trip.passenger
    @driver = @trip.driver
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trips_params)
    # if result
       redirect_to trips_path(@trip.id)
    # else
    #   render :edit
    # end
  end

  private

  def trips_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  end
end

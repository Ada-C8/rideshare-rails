class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new(passenger_id: params[:passenger_id], date: Date.today)
  end

  def create
    @trip = Trip.new(trip_params)
    result = @trip.save

    if result
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
    result = @trip.update(trip_params)

    if result
      redirect_back(fallback_location: trip_path(@trip.id))
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    result = @trip.destroy

    if result
      redirect_to passenger_path(@trip.passenger_id)
    else
      # error
    end
  end

  private
  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

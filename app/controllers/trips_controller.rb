class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def new
    default_date = Date.today
    @trip = Trip.new(driver_id: Driver.best_available(default_date).id, passenger_id: params[:passenger_id], date: default_date)
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

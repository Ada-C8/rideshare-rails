class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def new
    default_date = Date.today

    @trip = Trip.new(driver_id: Driver.best_available(default_date).id, passenger_id: params[:passenger_id], date: default_date)

    # if request.referer.include?(root_path)
    #   @trip = Trip.new(driver_id: params[:driver_id], passenger_id: params[:passenger_id], date: default_date)
    # else
    #   @trip = Trip.new(driver_id: Driver.best_available(default_date).id, passenger_id: params[:passenger_id], date: default_date)
    # end
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
      if request.referer.include?(edit_trip_path)
        redirect_to trip_path(@trip.id)
      else
        redirect_back(fallback_location: trip_path(@trip.id))
      end
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    result = @trip.destroy

    redirect_to passenger_path(@trip.passenger_id)
  end

  private
  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

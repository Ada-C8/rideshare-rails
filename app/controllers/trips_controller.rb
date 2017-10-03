class TripsController < ApplicationController

  def home

  end

  def index
    @trips = Trip.order(:id)
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(name: params[:trip][:name], phone_number: params[:passenger][:phone_number])
    if @trip.save
      redirect_to passenger_index_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
    unless @trip
      redirect_to trip_index_path
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    result = @trip.update({
      rating: params[:trip][:rating]})
      if result
        redirect_to trip_path(@trip.id)
      else
        render :edit
      end
  end

  def delete
    trip = Trip.find_by(id: params[:id])

    if trip.destroy
      redirect_to trips_index_path
    else

    end
  end

private

def passenger_params
  return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
end

end

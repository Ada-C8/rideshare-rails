class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def edit
  end

  def edit_rating
    @trip = Trip.find_by(id: params[:id])
  end

  def update
  end

  def update_rating
    @trip = Trip.find_by(id: params["id"])

    @trip.rating = params[:trip][:rating].to_i
    passenger = Trip.find(@trip.id).passenger
    @trip.save
    redirect_to passenger_path(passenger.id)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new

    passenger = Passenger.find_by(id: params[:passenger])

    @trip.passenger = passenger
    @trip.driver = Driver.all.sample

    @trip.date = Date.today.to_s

    @trip.cost = 1000 #$10

    if @trip.save
      redirect_to passenger_path(params[:passenger])
    end
  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:name, :phone_num)
  end

end

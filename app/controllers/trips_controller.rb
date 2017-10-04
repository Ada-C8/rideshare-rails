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

  # def new
  #   @trip = Trip.new
  # end

  # def create
  def new
    driver_ids = find_driver_ids()
    @trip = Trip.new(
    date: Date.today,
    cost: rand(100..2000),
    driver_id: driver_ids.sample.to_i, passenger_id: params[:passenger_id],
    rating: nil)
    @trip.save!

    # if @trip.save
    #   redirect_to passenger_path(params[:passenger_id])
    # else
    #   redirect_to root_path
    # end
  end

  # trip = Trip.new(
  # driver_id: Driver.first,
  # passenger_id: Passenger.find_by(params[:id]),
  # date: Date.today,
  # cost: rand(10..100),
  # rating: 0
  # )
  # trip.save!
  # puts @trip.errors.inspect
  # if trip.save
  #   redirect_to trips_path
  # else
  #   render :new
  # end

  private
  # def trips_params
  #   return params.require(:trip).permit(:driver_id, :passenger_id, :date, :cost, :rating)
  # end
  def find_driver_ids
    driver_ids = []
    Driver.all.each do |driver|
      driver_ids << driver.id
    end
    return driver_ids
  end
end

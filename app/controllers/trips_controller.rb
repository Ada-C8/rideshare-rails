class TripsController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id].to_i)

    unless @trip
      redirect_to root_path
    end

    @passenger = @trip.passenger
    @driver = @trip.driver
  end

  def new
    driver_ids = find_driver_ids()
    @trip = Trip.new(date: Date.today, cost: rand(100..2000), driver_id: driver_ids.sample.to_i, passenger_id: params[:passenger_id], rating: nil)
    if @trip.save
      redirect_to passenger_path(params[:passenger_id])
    else
      redirect_to root_path
    end
  end

  private
  def find_driver_ids
    driver_ids = []
    Driver.all.each do |driver|
      driver_ids << driver.id
    end
    return driver_ids
  end
end

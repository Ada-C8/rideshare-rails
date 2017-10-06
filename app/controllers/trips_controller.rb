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
    driver_id = find_driver()
    @trip = Trip.new(date: Date.today, cost: rand(100..2000), driver_id: driver_id, passenger_id: params[:passenger_id], rating: nil)
    if @trip.save
      redirect_to passenger_path(params[:passenger_id])
    else
      redirect_to root_path
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    redirect_back(fallback: root_path) unless @trip

    if @trip.update_attributes trip_params
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def add_rating
    @trip = Trip.find_by(id: params[:id].to_i)

    if @trip.rating == nil
      (@trip.update_attributes trip_params) ? (redirect_to passenger_path(@trip.passenger_id.to_i)) : (render :edit)
    else
      redirect_to passenger_path(@trip.passenger_id.to_i)
    end
  end

  private

  def find_driver
    driver_id = Driver.where(status: 'online').sample.id.to_i
    return driver_id
  end

  def trip_params
    params.permit(:rating)
  end

end

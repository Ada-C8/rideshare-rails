class TripsController < ApplicationController
  def index
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def new
    @trip = Trip.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      redirect_to :new
    end
  end

  def destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:name, :phone_num)
  end

end

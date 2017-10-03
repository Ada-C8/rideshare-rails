class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)

    passenger.save
    redirect_to('/passengers')
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @passenger.save
    redirect_to passengers_path
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger = Passenger.update(passenger_params)
    @passenger.save

    redirect_to passenger_path(@passenger)
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end

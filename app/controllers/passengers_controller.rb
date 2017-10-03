class PassengersController < ApplicationController
  def create
  end

  def destroy
  end

  def edit
  end

  def index
    @passenger = Passenger.all #order(:name)
  end

  def new
  end

  def show
    @passenger = Passenger.find( params[:id].to_i)
    @trip = Trip.find( params[:id].to_i)
  end

  def update
  end
end

private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

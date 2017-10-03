class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to('/passengers')
    else
      # show errors to user
      render :new
    end


  end

  def show
    @passenger = Passenger.find(params[:id])

    @trips = Trip.find_by_passenger_id(params[:id])

  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

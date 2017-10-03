class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.order(:name)
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(
    passenger_params
    )
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end


  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

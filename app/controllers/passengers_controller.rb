class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all.order('name asc')
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to('/passengers')
    else
      render :new
    end

  end

  def new
    @passenger = Passenger.new
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update_attributes(passenger_params)
    if @passenger.save
      redirect_to(passenger_path(@passenger))
    else
      render :new
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy

    redirect_to passengers_path
  end

private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

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

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def create
    passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.name = passenger_updates[:name]
    @passenger.phone_num = passenger_updates[:phone_num]
    @passenger.save
    redirect_to passengers_path(@passenger.id)
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to passengers_path
  end
  #YOU DIANE
  #def show def new def create def edit def update def destroy
end

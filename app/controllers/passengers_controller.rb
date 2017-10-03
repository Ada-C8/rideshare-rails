class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id].to_i)

    unless @passenger
      redirect_to passengers_path
    end
  end

  def update
  end

  def create
    @passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num])
    if @passenger.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Passenger.find_by(id: params[:id]).destroy
    redirect_to passengers_path
  end

end

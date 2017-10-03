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
    name: params[:passenger][:name],
    phone_num: params[:passenger][:phone_num]
    )
    if @passenger.save
    redirect_to passengers_path
    else
      render :new
    end
  end
end

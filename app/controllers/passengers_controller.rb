class PassengersController < ApplicationController
  def new
    @passenger = Passenger.new
  end



  def create
    @passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num])

    if @passenger.save
      redirect_to @passenger
    else
      render 'new'
    end

  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def index
    @passengers = Passenger.all
  end
end

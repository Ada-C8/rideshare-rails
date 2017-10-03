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
    @passenger = Passenger.new(
    name: params[:passenger][:name],
    phone_number: params[:passenger][:phone_number]

    )
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    result = @passenger.update(
    name: params[:passenger][:name],
    phone_number: params[:passenger][:phone_number]
    )
    if result
      redirect_to passenger_path(params[:id])
    else
      render :edit
    end
  end

  # def destroy
  #   passenger = Passenger.find(params[:id])
  #   result = passenger.destroy
  #   if result
  #     redirect_to passengers_path
  #   else
  #     redirect_to passenger_path(params[:id])
  #   end
  # end
end

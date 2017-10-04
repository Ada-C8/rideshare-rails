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
    # @passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num])
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to @passenger
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    # @passenger.update(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num])
    @passenger.update(passenger_params)
    if @passenger.save
      # redirect_to @passenger
      redirect_to passenger_path(@passenger.id)
    else
      render :edit
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    redirect_to @passenger
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num, :passenger_id)
  end

end

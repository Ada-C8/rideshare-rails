class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.all.find(params[:id].to_i)
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id].to_i)
  end

  def update
    @passenger = Passenger.find_by(id: params[:id].to_i)

    redirect_to passengers_path unless @passenger
    if @passenger.update_attributes passenger_params
      redirect_to passengers_path
    else
      render :edit
    end

  end

  def destroy
    Passenger.find_by(id: params[:id]).destroy
    redirect_to passengers_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:name)
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    unless @passenger
      redirect_to passengers_path
    end

  end

  def update
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.update_attributes(passenger_params)
      redirect_to passenger_path(@passenger.id)
    else
      render :edit
    end
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

  def destroy
    @passenger = Passenger.find_by(id: params[:id]).destroy
    redirect_to passengers_path

  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end

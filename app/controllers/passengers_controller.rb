class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:id)
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
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
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end

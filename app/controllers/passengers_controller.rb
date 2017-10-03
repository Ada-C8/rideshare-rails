class PassengersController < ApplicationController
  def index
    @passengers= Passenger.order(:id)
  end

  def show
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def new
    @passenger = Passenger.new
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end

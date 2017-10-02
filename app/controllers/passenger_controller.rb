class PassengerController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id].to_i)

    unless @passenger
      redirect_to passengers_path
    end

    @trips = @passenger.trips
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end

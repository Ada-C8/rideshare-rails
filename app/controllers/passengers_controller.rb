class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def new
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
    Passenger.find_by(id: params[:id]).destroy
    redirect_to passengers_path
  end

end

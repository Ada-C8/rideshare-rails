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

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def create
    strong_params = passenger_params
    @passenger = Passenger.new(strong_params)
    @passenger.save
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def update
    strong_params = passenger_params
    @passenger = Passenger.find(params[:id])
    @passenger.update_attributes(strong_params)
    @passenger.save
    redirect_to passengers_path
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy
    redirect_to passengers_path
  end


  #YOU DIANE
  #def show def new def create def edit def update def destroy

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end


end

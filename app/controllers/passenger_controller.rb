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
    @passenger = Passenger.find_by(id: params[:id].to_i)

    unless @passenger
      redirect_to root_path
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id].to_i)
    redirect_to passenger_path unless @passenger

    if @passenger.update_attributes passenger_params
      redirect_to passenger_path
    else
      render :edit
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new passenger_params
    if @passenger.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Passenger.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

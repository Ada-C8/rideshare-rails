class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id].to_i)

    unless @passenger
      redirect_to passengers_path
    end
  end

  def update
    passenger = Passenger.find_by(id: params[:id].to_i)
    redirect to passengers_path unless passenger

    if passenger.update_attributes passenger_params
      redirect_to passenger
    else
      render :edit
    end
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

  def destroy
    Passenger.find_by(id: params[:id]).destroy
    redirect_to passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone_num)
  end
end

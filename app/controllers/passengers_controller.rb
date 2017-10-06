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

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update(passenger_params)
    @passenger.save

    redirect_to passenger_path(@passenger)
  end

  def destroy
  @passenger = Passenger.find(params[:id])
    # if @passenger.trips.count > 0 #without this it will error when passenger has trips
    #   redirect_to passenger_path(@passenger)
    #   return
    # end
      @passenger.destroy

    redirect_to passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone_num)
  end

end

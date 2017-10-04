class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to('/passengers')
    else
      # show errors to user
      render :new
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
    @trips = Trip.where(passenger_id: params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger_updates = params[:passenger]
    @passenger = Passenger.find(params[:id])
    # @passenger.update_attributes(task_updates)
    # @passenger.save

    @passenger.name = passenger_updates[:name]
    @passenger.phone_num = passenger_updates[:phone_num]
    @passenger.save

    redirect_to passenger_path(@passenger)
  end

private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

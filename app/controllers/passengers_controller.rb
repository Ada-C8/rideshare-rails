class PassengersController < ApplicationController
  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def destroy
    Passenger.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def index
    @passenger = Passenger.all #order(:name)
  end

  def new
    @passenger = Passenger.new
  end

  def show
    @passenger = Passenger.find( params[:id].to_i)
    @trip = Trip.find( params[:id].to_i)
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update_attributes(passenger_params)
    if @passenger.save
      redirect_to(passenger_path(@passenger))
    else
      render :new
    end

  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

# def nilpass
#   if Passenger.find(params[:id])!= Passenger.find(params[:id])
#     @passenger = nil


end #end of class

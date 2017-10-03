class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:name)
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(name: params[:passenger][:name], phone_num: params[:passenger][:phone_num] )
    if passenger.save
      flash[:notice] = "#{passenger.name} was successfully saved"
      redirect_to 'new_passenger_path'
    else
      render :new
    end
  end

  def destroy
  end
end

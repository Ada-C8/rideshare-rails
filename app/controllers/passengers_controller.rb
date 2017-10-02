class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:id)
  end

  def show
    @passenger = Passenger.find_by(params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(name: params[:passenger][:name], phone_number: params[:passenger][:phone_number])
    if @passenger.save
      redirect_to passenger_index_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(params[:id])
  end

  def update_trip
    @passenger = Passenger.find(params[:id].to_i)
    @passenger.update_attributes passenger_params
    if @passenger.save
      redirect_to passenger_index_path
    else
      render :new
    end

  end

  def delete
    passenger = Passenger.find_by(params[:id])

    if passenger.destroy
      redirect_to passenger_index_path
    else

    end
  end


end

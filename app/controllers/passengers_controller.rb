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
      redirect_to passengers_path
    else
      render :new
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id].to_i)
    name = @passenger.name
    if @passenger.destroy
      flash[:notice] = "#{name} was successfully deleted, bye!"
      redirect_to passengers_path
    else
      render :index
    end
  end
end

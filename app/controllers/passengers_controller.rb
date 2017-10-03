class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:name)
  end

  def show
  end

  def edit
    @passenger = Passenger.find(params[:id].to_i)
  end

  def update
    @passenger = Passenger.find(params[:id].to_i)
    redirect_to passengers_path unless @passenger
    @passenger.name = params[:passenger][:name]
    @passenger.phone_num = params[:passenger][:phone_num]
    if @passenger.save
      flash[:notice] = "#{@passenger.name} was successfully updated"
      redirect_to passengers_path
    else
      render :edit
    end
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

class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:name)
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create
    # use strong params to limit the fields that the user can populate with data
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      # if the save was sucessful then:
      redirect_to passengers_path
    else
      # if @passenger wasn't saved to the database then:
       render :new
    end # if/else
  end # create

  def edit
    @passenger = Passenger.find(params[:id])
  end # edit

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update_attributes(passenger_params)

    if @passenger.save
      redirect_to passenger_path(@passenger)
    else
      render :edit
    end # if/else
  end # update

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    redirect_to passengers_path
  end # destroy

  private
    def passenger_params
      return params.require(:passenger).permit(:name, :phone_number)
    end


end

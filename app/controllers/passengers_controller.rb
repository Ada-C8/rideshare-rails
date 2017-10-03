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
    strong_params = passenger_params
    @passenger = Passenger.new(strong_params)

    if @passenger.save
      # if the save was sucessful then:
      redirect_to passengers_path
    else
      # if @passenger wasn't saved to the database then:
       render :new
    end # if/else
  end # create

  private
    def passenger_params
      return params.require(:passenger).permit(:name, :phone_number)
    end

  # TODO: make edit use strong params too!
end

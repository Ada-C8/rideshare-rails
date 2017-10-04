class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order([:id])
    # get different results if I order by params[:passenger_id]
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])
    # this gets page to load but shows wrong passenger??
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(name: params[:passenger][:name], phone_number: params[:passenger][:phone_number])
    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
    unless @passenger
      redirect_to passengers_path
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    result = @passenger.update({
      name: params[:passenger][:name],
      phone_number: params[:passenger][:phone_number]
      })
      if result
        redirect_to passenger_path(@passenger.id)
      else
        render :edit
      end
    end

    def destroy
      passenger = Passenger.find_by(id: params[:id])

      if passenger.destroy
        redirect_to passengers_path
      else

      end
    end

    private

    def passenger_params
      return params.require(:passenger).permit(:name, :phone_number)
    end

  end

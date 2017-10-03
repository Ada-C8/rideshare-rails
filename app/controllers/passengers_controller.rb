class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:id)
  end

  def show
    @passenger = Passenger.find_by(params[:passenger_id])
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
    @passenger = Passenger.find_by(params[:passenger_id])
    unless @passenger
      redirect_to passenger_path(@passenger.id)
    end
  end

  def update
    @passenger = Passenger.find_by(params[:passenger_id])
    result = @passenger.update({
      name: params[:passenger][:name],
      phone_number: params[:passenger][:phone_number]
      })
      if result
        redirect_to passenger_path(@passenger.id)
        # this takes me to the results for a different passenger and I have no idea why ?!
      else
        render :edit
      end
    end

    def delete
      passenger = Passenger.find_by(params[:passenger_id])

      if passenger.destroy
        redirect_to passenger_index_path
      else

      end
    end


  end

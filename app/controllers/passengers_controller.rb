class PassengersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @passengers= Passenger.order(:id)
  end

  def show
    @passenger = Passenger.find_by(id: params[:id].to_i)
    @trips = Trip.where(passenger_id: params[:id].to_i).order(sort_string)

    # if passenger not found
    unless @passenger
      flash[:error] = "Passenger not found"
      redirect_to passengers_path
    end
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      flash[:notice] = "Passenger successfully created"
      redirect_to passengers_path
    else
      render :new
    end
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.update_attributes(passenger_params)
      flash[:notice] = "Passenger updated"
      redirect_to passengers_path
    else
      render :edit
    end
  end

  def destroy
    @passenger = Passenger.find_by(id: params[:id])
    @passenger.destroy

    redirect_to passengers_path
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create_trip
    @passenger = Passenger.find_by(id: params[:id].to_i)
    @passenger.create_trip
    flash[:notice] = "Trip added"
    redirect_to passenger_path(@passenger.id)
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

  def sort_string
    return sort_column + " " + sort_direction
  end

  # sanitize input
  def sort_column
    ["date", "cost", "rating"].include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    ["DESC", "ASC"].include?(params[:direction])? params[:direction] : "DESC"
  end

end

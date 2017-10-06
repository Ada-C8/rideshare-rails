class RidersController < ApplicationController
  #CRUD METHODS
  def index
    @riders = Rider.order(:id)
  end

  def show
    @rider = Rider.find_by(id: params[:id].to_i)

    @trips = @rider.trips.order(:id)
  end

  def edit
    @rider = Rider.find_by(id: params[:id].to_i)
    redirect_to riders_path unless @rider
  end

  def update
    rider = Rider.find_by(id: params[:id])
    redirect_to riders_path unless rider

    rider.update_attributes(rider_params) ? (redirect_to rider_path(params[:id])) : (render :edit)
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(name: params[:rider][:name], phone: params[:rider][:phone])

    @rider.save ? (redirect_to riders_path) : (render :new)
  end

  def destroy
    redirect_to riders_path if Rider.find_by(id: params[:id]).destroy
  end

  def create_trip
    trip =  Rider.find_by(id: params[:id]).start_trip

    if trip
      redirect_to trip_path(trip.id)
    else
      flash[:notice] = "No available Drivers today. So sorry!"
      redirect_to rider_path(params[:id])
    end
  end

  private
  def rider_params
    return params.require(:rider).permit(:name,:phone)
  end
end

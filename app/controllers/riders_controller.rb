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

    rider.update_attributes(rider_params) ? (redirect_to riders_path) : (render :edit)
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(name: params[:rider][:name], phone: params[:rider][:phone])

    @rider.save ? (redirect_to riders_path) : (render :new)
  end

  def destroy

  end

  private
  def rider_params
    return params.require(:rider).permit(:name,:phone)
  end
end

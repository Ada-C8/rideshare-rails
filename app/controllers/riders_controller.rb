class RidersController < ApplicationController
  #CRUD METHODS
  def index
    @riders = Rider.order(:id)
  end

  def show
    @rider = Rider.find_by(id: params[:id].to_i)
  end

  def edit
    @rider = Rider.find_by(id: params[:id].to_i)
    redirect_to riders_path unless @rider 
  end

  def new

  end

  def update

  end

  def destroy

  end
end

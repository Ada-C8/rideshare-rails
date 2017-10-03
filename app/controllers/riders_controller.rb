class RidersController < ApplicationController
  #CRUD METHODS
  def index
    @riders = Rider.order(:id)
  end

  def show
    @rider = Rider.find_by(id: params[:id].to_i)
  end

  def edit

  end

  def new

  end

  def update

  end

  def destroy

  end
end

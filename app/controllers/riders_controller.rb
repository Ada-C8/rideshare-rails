class RidersController < ApplicationController
  #CRUD METHODS
  def index
    @riders = Rider.order(:id)
  end

  def show

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

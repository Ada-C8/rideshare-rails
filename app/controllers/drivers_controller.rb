class DriversController < ApplicationController
  #CRUD METHODS
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
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

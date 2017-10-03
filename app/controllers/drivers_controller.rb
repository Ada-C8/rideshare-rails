class DriversController < ApplicationController
  #CRUD METHODS
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    @trips = @driver.trips
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
    redirect_to drivers_path unless @driver
  end

  def new

  end

  def update

  end

  def destroy

  end
end

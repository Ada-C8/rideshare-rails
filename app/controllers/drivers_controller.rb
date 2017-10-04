class DriversController < ApplicationController
  #CRUD METHODS
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    @trips = @driver.trips.order(:id)
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
    redirect_to drivers_path unless @driver
  end

  def update
    driver = Driver.find_by(id: params[:id])
    redirect_to drivers_path unless driver

    driver.update_attributes(driver_params) ? (redirect_to drivers_path) : (render :edit)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])

    @driver.save ? (redirect_to drivers_path) : (render :new)
  end

  def destroy

  end

private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

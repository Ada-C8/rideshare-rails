class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new(driver_params)
  end

  def create
    driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    driver.save
    redirect_to drivers_path
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update_attributes(driver_params)
    redirect_to driver_path(@driver)
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end

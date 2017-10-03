class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.new(driver_params)

    driver.save
    redirect_to('/drivers')
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update_attributes(driver_params)
    @driver.save
    redirect_to driver_path(@driver)
  end

  def show
    @driver = Driver.find(params[:id])
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

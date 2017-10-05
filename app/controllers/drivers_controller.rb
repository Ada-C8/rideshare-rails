class DriversController < ApplicationController
  def index
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to @driver
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)

    unless @driver
      redirect_to drivers_path
    end
  end

  def update
    driver = Driver.find_by(id: params[:id].to_i)
    redirect to drivers_path unless driver

    if driver.update_attributes driver_params
      redirect_to driver
    else
      render :edit
    end
  end

  def show
  end

  def destroy
  end

  private

  def driver_params
    params.require(:driverr).permit(:name, :vin)
  end
end

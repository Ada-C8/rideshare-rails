class DriversController < ApplicationController
  def index
    @drivers = Driver.all
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
    @driver = Driver.find(params[:id])
  end

  def destroy
    Driver.find_by(id: params[:id]).destroy
    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end
end

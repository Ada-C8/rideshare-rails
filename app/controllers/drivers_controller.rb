class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def create
    # @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :new
    end
  end

  def new
    @driver = Driver.new
  end

  def update
    @driver = Driver.find(params[:id])
    # driver_updates = params.require(:driver).permit(:name, :vin)
    @driver.update_attributes(driver_params)
    # @driver.save
    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
    # redirect_to driver_path
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

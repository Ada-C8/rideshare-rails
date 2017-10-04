class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(
      # name: params[:driver][:name],
      # VIN: params[:driver][:VIN]
      driver_params
    )
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    result = @driver.update(
      name: params[:driver][:name],
      vin: params[:driver][:vin]
    )

    if result
      redirect_to driver_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    driver = Driver.find(params[:id])
    result = driver.destroy
    if result
      redirect_to drivers_path
    else
      redirect_to driver_path(params[:id])
    end
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

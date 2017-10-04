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
      redirect_to('/drivers')
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    driver_updates = params[:driver]
    @driver = Driver.find(params[:id])
    @driver.name = driver_updates[:name]
    @driver.vin = driver_updates[:vin]
    if @driver.save
      redirect_to driver_path(@driver)
    else
      render :new
    end
  end

  def show
    @driver = Driver.find(params[:id])

    @trips = Trip.where(driver_id: params[:id])
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

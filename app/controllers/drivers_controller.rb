class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end



  def create
    # strong_params = driver_params
    # prevents handrolling http requests from messing up your data

    # @driver = Driver.new(strong_params)
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to('/drivers')
    else
      render :new
    end

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
    @driver.save
    redirect_to driver_path(@driver)
  end

private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end

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
    @driver = Driver.new(driver_params)
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
    @driver.update(driver_params)
    @driver.save

    redirect_to driver_path(@driver)
  end

  def destroy
  @driver = Driver.find(params[:id])
  if @driver.trips.count > 0
    redirect_to driver_path
    return
  end
    @driver.destroy

  redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end

end

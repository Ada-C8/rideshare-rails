class DriversController < ApplicationController
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    redirect_to drivers_path
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  #### ^^^^^ work on that later

  def show
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update_attributes(driver_params)
    if @driver.save
      redirect_to(driver_path(@driver))
    else
      render :new
    end
  end
end

private
def driver_params
  return params.require(:driver).permit(:name, :vin)
end

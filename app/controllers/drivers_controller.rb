class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    unless @driver
      redirect_to drivers_path
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    redirect_to driver_path unless @driver

    if @driver.update_attributes(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      return redirect_to drivers_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

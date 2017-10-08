class DriversController < ApplicationController
  @my_offset = 0
  def index
    @drivers = Driver.all
    @drivers = Driver.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    @trips = Trip.where(driver_id: params[:id])
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
    unless @driver
      redirect_to driver_path
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    redirect_to driver_path unless @driver
    if @driver.update_attributes driver_params
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
      redirect_to drivers_path
    else
      render :new
    end
  end

  def destroy
    Driver.find_by(id: params[:id]).destroy
    redirect_to drivers_path
  end

  def available #a controller action vs a method, not actually calling this method we're calling an attribute value
  driver = Driver.find_by(id: params[:id])

  if driver.available
    driver.update_attribute(:available, false)
  else
    driver.update_attribute(:available, true)
  end
    redirect_to driver_path
  end


  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

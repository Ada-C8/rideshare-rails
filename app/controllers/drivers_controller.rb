class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
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
    result = @driver.update_attributes(driver_params)

    if result
      redirect_to driver_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    driver = Driver.find(params[:id])
    result = driver.destroy
    if result # Need to make the driver_id in Trips as nil? And render it in the view page as if nil, say Driver no longer exists for this Trip
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

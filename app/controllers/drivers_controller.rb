class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    @trips = Trip.where(driver_id: params[:id])
  end

  def edit
  end

  def update
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
  end


  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

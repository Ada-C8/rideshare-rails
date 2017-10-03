class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:id)
  end

  def show
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

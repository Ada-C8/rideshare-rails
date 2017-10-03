class DriversController < ApplicationController
  def create
    @driver = Driver.new(
    driver_params
    )
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new()
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def update
  end
end

private
def driver_params
  return params.require(:driver).permit(:name, :vin)
end

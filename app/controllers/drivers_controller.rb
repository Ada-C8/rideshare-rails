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
    @driver = Driver.new(drivers_params
    )
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  private
  def drivers_params
    return params.require(:driver).permit(:name, :vin)
  end
end

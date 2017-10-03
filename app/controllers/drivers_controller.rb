class DriversController < ApplicationController
  def index
      @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id])
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
      redirect_to :new
    end
  end

  def destroy
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

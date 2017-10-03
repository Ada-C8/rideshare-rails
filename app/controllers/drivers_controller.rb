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

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    result = @driver.update(drivers_params)

    if result
      redirect_to drivers_path(@driver.id)
    else
      render :edit
    end
  end

  private
  def drivers_params
    return params.require(:driver).permit(:name, :vin)
  end
end

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
  end

  def edit
    @driver = Driver.find(params[:id])
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
    # @driver = Driver.find(params[:id])
    # @driver.update_attributes(driver_params)
    # if @passenger.save
    #   redirect_to(driver_path(@driver))
    # else
    #   render :new
    # end
  end
end

class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(
      name: params[:driver][:name],
      vin: params[:driver][:vin]
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
    result = @driver.update({
      name: params[:driver][:name],
      vin: params[:driver][:vin]
      })
      if result
        redirect_to driver_path(@driver.id)
      else
        render :edit
      end
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def destroy
    driver = Driver.find(params[:id])

    driver.destroy

    redirect_to drivers_path
  end
end

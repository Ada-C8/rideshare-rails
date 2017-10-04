class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
    unless @driver
      redirect_to drivers_path
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id])
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

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.destroy
      redirect_to driver_path
    else

    end
  end

  def status
    @driver = Driver.find_by(id: params[:id])
    @driver.status ? @driver.update(status: false) : @driver.update(status: true)
    redirect_to driver_path(@driver.id)

  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end

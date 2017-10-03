class DriverController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    unless @driver
      redirect_to drivers_path
    end

    @trips = @driver.trips
    @rating = rating(@trips)
    @total = total(@trips)
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)

    unless @driver
      redirect_to root_path
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    redirect_to driver_path unless @driver

    if @driver.update_attributes driver_params
      redirect_to driver_path
    else
      render :edit
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new driver_params
    if @driver.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Driver.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

  def rating(trips)
    return trips.sum {|trip| trip.rating} / trips.length.to_f
  end

  def total(trips)
    return trips.sum {|trip| trip.cost}
  end
end

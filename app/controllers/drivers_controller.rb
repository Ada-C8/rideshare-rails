class DriversController < ApplicationController

  def index
    if session[:sorter] == 'rating'
      @drivers = Driver.all.sort_by {|driver| -driver.average_rating}
    else
      @drivers = Driver.all.order(:name)
    end
    session[:sorter] = nil
  end

  def new
    @driver = Driver.new
  end

  def create
    # @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def show
    @driver = Driver.find(params[:id])
    @trips = @driver.trips
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    result = @driver.update(driver_params)

    if result
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def destroy
    driver = Driver.find(params[:id])
    if driver.destroy
      redirect_to drivers_path
    else
      #if unsuccessful show an error
    end
  end

  def sort_by_rating
    session[:sorter] = :rating
    redirect_to drivers_path
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

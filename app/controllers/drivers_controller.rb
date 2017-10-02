class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    if @driver.save
      redirect_to driver_index_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(params[:id])
  end

  def update_trip
    @driver = Driver.find(params[:id].to_i)
    @driver.update_attributes driver_params
    if @driver.save
      redirect_to driver_index_path
    else
      render :new
    end

  end

  def delete
    driver = Driver.find_by(params[:id])

    if driver.destroy
      redirect_to driver_index_path
    else

    end
  end


end

class DriversController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
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

  def destroy
  end
end

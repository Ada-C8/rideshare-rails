class DriversController < ApplicationController

def index
  @drivers = Driver.all
end

def show
  @driver = Driver.find(params[:id].to_i)
end

def new
  @driver = Driver.new
end

def create
  @driver = Driver.new(drivers_params)
  if @driver.save
    redirect_to drivers_path
  else
    render :new
  end
end

def edit
  @driver = Driver.find_by(id: params[:id].to_i)
end

def update
  @driver = Driver.find_by(id: params[:id].to_i)
  redirect_to drivers_path unless @driver

  if @driver.update_attributes drivers_params
    redirect_to drivers_path
  else
    render :edit
  end
end

def destroy
  Driver.find_by(id: params[:id]).destroy
  redirect_to drivers_path
end

def available
  @driver = Driver.find_by(id: params[:id])
  redirect_to drivers_path unless @driver

  if @driver.available?
    @driver.update_attribute(:available, false)
  else
    @driver.update_attribute(:available, true)
  end

  redirect_to driver_path
end

private

def drivers_params
  return params.require(:driver).permit(:name, :vin)
end
end

class DriversController < ApplicationController

def index
  @drivers = Driver.all
end

def show
  @driver = Driver.find( params[:id].to_i )
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

private

def drivers_params

end
end

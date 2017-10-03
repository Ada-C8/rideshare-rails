class DriversController < ApplicationController

    def index
      @drivers = Driver.all
    end

    def show
      @driver = Driver.find(params[:id])
    end

    def new
      @driver = Driver.new
    end

    def edit
      @driver = Driver.find(params[:id])
    end

    def create
     driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
     driver.save
     redirect_to drivers_path
    end

    def update
    @driver = Driver.find(params[:id])
    @driver.name = params[:driver][:name]
    @driver.vin = params[:driver][:vin]
    puts
    puts @driver.name
    @driver.save
    puts
    puts @driver.name
    redirect_to drivers_path
    end

    def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
    end


  #def show def new def create def edit def update def destroy
end

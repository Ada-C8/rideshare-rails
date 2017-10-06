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
     @driver = Driver.new(driver_params)
     @driver.save
     if @driver.save
       redirect_to drivers_path
     else
       render :new
     end
    end

    def update
    @driver = Driver.find(params[:id])
    @driver.update_attributes(driver_params)
    @driver.save

    redirect_to drivers_path
    end

    def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
    end

    private
    def driver_params
      return params.require(:driver).permit(:name, :vin)
    end


  #def show def new def create def edit def update def destroy
end

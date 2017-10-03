class DriversController < ApplicationController
  
    def index
      @drivers = Driver.all
    end

    def show
      @driver = Driver.find(params[:id])
    end


  #def show def new def create def edit def update def destroy
end

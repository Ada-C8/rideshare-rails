class DriversController < ApplicationController
  def new
    @driver = Driver.new
  end



  def create
    @driver = Driver.new(name: params[:driver][:name],
                    vin: params[:driver][:vin]
                    )

    if @driver.save
      redirect_to @driver
    else
      render 'new'
    end

  end

  def show
    @driver = Driver.find(params[:id])
  end

  def index
    @driver = Driver.all
  end
end

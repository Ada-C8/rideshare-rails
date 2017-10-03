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
    @drvier = Driver.new(name: params[:drvier][:name], description: params[:driver][:VIN])
    if @driver.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end
end

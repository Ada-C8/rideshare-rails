class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def destroy
    Driver.find_by(id: params[:id]).destroy
    redirect_to drivers_path
  end
end

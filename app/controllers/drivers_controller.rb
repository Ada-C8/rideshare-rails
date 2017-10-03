class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
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
  end
end

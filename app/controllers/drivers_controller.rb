class DriversController < ApplicationController
  def create
  end

  def destroy
  end

  def edit
  end

  def index
    @drivers = Driver.all
  end

  def new
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def update
  end
end

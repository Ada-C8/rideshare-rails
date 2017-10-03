class DriverController < ApplicationController
  #CRUD METHODS
  def index
    @drivers = Driver.order(:id)
  end

  def show

  end

  def edit

  end

  def new

  end

  def update

  end

  def destroy

  end
end

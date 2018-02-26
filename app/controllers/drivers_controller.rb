class DriversController < ApplicationController
  before_action :find_driver, only: [:show, :edit, :update, :destroy]

  def index

    if params[:search]
      search_drivers = Driver.search(params[:search]).order(:name)
      @drivers = search_drivers.paginate(:page => params[:page], :per_page => 9)
    else
      @drivers = Driver.all.paginate(:page => params[:page], :per_page => 9)
    end

  end

  def show

  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @driver.update(driver_params)
      redirect_to driver_path(@driver)
    else
      render "edit"
    end
  end

  def destroy
    @driver.destroy
    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end

  def find_driver
    @driver = Driver.find(params[:id])
  end


end

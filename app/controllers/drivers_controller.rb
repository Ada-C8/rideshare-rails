class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @driver = set_driver
  end

  def new
    @driver = Driver.new
  end

  def create
    # use strong params to limit the fields that the user can populate with data
    @driver = Driver.new(driver_params)

    if @driver.save
      # if the save was sucessful then:
      redirect_to drivers_path
    else
      # if @driver wasn't saved to the database then:
      render :new
    end # if/else
  end # create

  def edit
    @driver = set_driver
  end # edit

  def update
    @driver = set_driver
    @driver.update_attributes(driver_params)

    if @driver.save
      redirect_to driver_path(@driver)
    else
      render :edit
    end # if/else
  end # update

  def destroy
    @driver = set_driver
    @driver.destroy
    redirect_to drivers_path
  end # destroy

  private
  def driver_params
    params.require(:driver).permit(:name, :vin)
  end

  def set_driver
    Driver.find(params[:id])
  end
end

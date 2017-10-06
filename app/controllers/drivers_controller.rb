class DriversController < ApplicationController
  def index
    @drivers = Driver.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    @trips = Trip.where(driver_id: params[:id].to_i).order("date DESC")

  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      flash[:notice] = "Driver successfully created"
      redirect_to drivers_path
    else
      render :new
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)

    if @driver.update_attributes(driver_params)
      flash[:notice] = "Driver updated"
      redirect_to drivers_path
    else
      render :edit
    end
  end

  def destroy
    @driver = Driver.find_by(id: params[:id].to_i)
    @driver.destroy

    redirect_to drivers_path
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
  end

  def new
    @driver = Driver.new
  end

  # def sort_trips_date
  #   @order == "date DESC" ? @trips.order("date ASC") : @trips.order("date DESC")
  #
  #   redirect_back(fallback_location: root_path)
  # end
  #
  # def sort_trips_cost
  #   @order == "date DESC" || @order == "cost ASC" ? @trips.order("cost DESC") : @trips.order("cost ASC")
  #
  #   redirect_back(fallback_location: root_path)
  # end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

class DriversController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @drivers = Driver.order(:id)
    @drivers = Driver.all.paginate(page: params[:page], per_page: 30)

  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
    @trips = Trip.where(driver_id: params[:id].to_i).order(sort_string)

    # if driver not found
    unless @driver
      flash[:error] = "Driver not found"
      redirect_to drivers_path
    end
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

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

  def sort_string
    return sort_column + " " + sort_direction
  end

  # sanitize input
  def sort_column
    ["date", "cost"].include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    ["DESC", "ASC"].include?(params[:direction])? params[:direction] : "DESC"
  end
end

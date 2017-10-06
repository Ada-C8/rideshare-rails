class DriversController < ApplicationController
  def index
    @driver = Driver.order(:id)
  end

  def show
    @driver = Driver.find(params[:id])
    @trips = @driver.trips
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.name = params[:driver][:name]
    @driver.vin = params[:driver][:vin]
    if @driver.save
      redirect_to drivers_path
    else
      render :edit
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(name: params[:driver][:name], vin: params[:driver][:vin])
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def total_earnings
    trips = self.trips
    sum = 0
    trips.each do |trip|
      sum += trip.cost if trip.cost * '.15'.to_f
    end
    return sum 
  end
  #
  # def average_rating
  #   trips = self.trips
  #   sum = 0
  #   trips.each do |trip|
  #     sum += trip.cost if trip.cost
  #   end
  #   return sum
  # end

  def destroy
    @driver = Driver.find(params[:id]).destroy
    redirect_to drivers_path
  end
end

class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def create
  end

  def new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
  end

  def destroy
  end
end

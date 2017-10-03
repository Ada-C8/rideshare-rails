class TripsController < ApplicationController
  def create
  end

  def new
  end

  def edit
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
  end

  def destroy
  end
end

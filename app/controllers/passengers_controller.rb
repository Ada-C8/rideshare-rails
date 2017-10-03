class PassengersController < ApplicationController

def index
  @passengers = Passenger.all
end

def show
  @passenger = Passenger.find(params[:id])
end

def new
  @passenger = Passenger.new
end

def create
  @passenger = Page.new(params[:name, :phone_num])
  @passenger.save
  redirect_to @passenger
end

def edit
  @passenger = Passenger.find(params[:id])
end

def update
  @passenger = Page.find(params[:id])
  @passenger.update(params[:name, :phone_num])
  redirect_to @passenger
end

def destroy
  @passenger = Passenger.find(params[:id])
  @passenger.destroy
  redirect_to pages_path
end


end

class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end
end

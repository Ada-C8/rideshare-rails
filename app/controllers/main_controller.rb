class MainController < ApplicationController
  def index
    @passenger = Passenger.all.sample
    @drivers = Driver.by_rating[0..5]
  end
end

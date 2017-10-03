class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
end

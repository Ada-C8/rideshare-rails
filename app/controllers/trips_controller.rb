class TripsController < ApplicationController
  # def index
  #   if params[:driver_id]
  #     @trips = Driver.find(params[:driver_id]).trips.order(date: :desc)
  #   else
  #     @trips = Trip.all.order(date: :desc)
  #   end
  # end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new(passenger_id: params[:passenger][:passenger_id])
  end

  def create
    puts params
    @trip = Trip.new(
      driver_id: Driver.order("RANDOM()").first.id,
      passenger_id: params[:passenger_id],
      rating: 0,
      cost: rand(1000..10000),
      date: Date.today
    )
    if @trip.save
      redirect_to "/passengers/#{params[:passenger_id]}"
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    result = @trip.update({rating: params[:trip][:rating]})

      if result
        redirect_to "/passengers/#{params[:passenger_id]}"
      else
        render :edit
      end
  end

  def destroy
    trip = Trip.find(params[:id])
    # passenger_id = trip.passenger.id
    # driver_id = trip.driver.id
    trip.destroy

    redirect_to root_path

    ### NOTE ###
    #Ideally we would have liked to be able to direct to passenger page if passenger deleted the trip
    #and to driver page if the driver deleted the page
    #we have a hunch that we have to do nested routes and modify our controller form


    # if params[:passenger_id] != nil
    #   redirect_to passenger_path(passenger_id)
    # else
    #   redirect_to passenger_path(passenger_id)
    # end

    # if passenger_path(passenger.id)
    #   redirect_to passenger_path(passenger_id)
    # elsif driver_path(driver.id)
    #   redirect_to driver_path(driver_id)
    # end

    # "/passengers/#{passenger_id}"
  end
end

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
    result = @trip.update({
      rating: params[:trip][:rating]
      })
      if result
        redirect_to "/passengers/#{params[:passenger_id]}"
      else
        render :edit
      end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy

    redirect_to passengers_path
  end
end

class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
    @booking = @ride.bookings.build
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.completed = false
    if @ride.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    UserMailer.cancelled_ride(@ride).deliver_later
    @ride.destroy
    redirect_to user_path(current_user)
  end

  # Make and extra method for complete ride
  def complete
    @ride = Ride.find(params[:ride_id])
    @ride.completed = true
    @ride.save
    UserMailer.complete_ride(@ride).deliver_later
    redirect_to user_path(current_user)
  end

  private
  def ride_params
    params.require(:ride).permit(:date, :time, :seats_available, :price, :comments, :start_location, :end_location, :completed)
  end

end

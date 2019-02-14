require 'pry'
class BookingsController < ApplicationController

  def index
    if params[:user_id]
      @bookings = User.find(params[:user_id]).bookings
    else
      @bookings = Booking.all
    end
  end

  def new
    @booking = Booking.new(params[:id])
  end

  def create
    @flight = Flight.find(params[:booking][:flight])
    @booking = @flight.bookings.create(booking_params.merge(user_id: current_user.id))
     #binding.pry
    #@user.bookings << @booking
    redirect_to user_path(@booking.user_id)
  end

  def show
    #binding.pry
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:description, :paid, :user_id, :flight_id)
  end

end

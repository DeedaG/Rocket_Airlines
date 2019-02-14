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
    @user = current_user
    @booking = Booking.create(booking_params, @booking.user = current_user)
    @user.bookings << @booking
      redirect_to user_path(@booking.user_id)

  end

  def show
    #binding.pry
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:description, :paid)
  end

end

require 'pry'
class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    binding.pry
    if @booking.save
      redirect_to users_path(@booking.user_id)
    else
      render 'new'
    end
  end

  def show
    #binding.pry
    @booking = Booking.find_by(flight_id: params[:flight_id], user_id: params[:user_id])
  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :description, :flight_id)
  end
end

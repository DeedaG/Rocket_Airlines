class BookingsController < ApplicationController

  def index
    @booking = Booking.new
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    #raise params.inspect
    @booking = Booking.new(booking_params)
    @booking.flight_id = params[:booking][:flight_id]
    redirect_to booking_url(@booking)
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id)
  end
end

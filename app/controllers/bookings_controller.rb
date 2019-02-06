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

    @booking = Booking.create(description: params[:description], flight_id: params[:booking][:flight], user_id: params[:user_id])
    #raise params.inspect
    #binding.pry
    if @booking.save
    @user.bookings << @booking
      redirect_to user_path(@booking.user_id)
    else
      render 'new'
    end
  end

  def show
    #binding.pry
    @booking = Booking.find(params[:id])
  end


end

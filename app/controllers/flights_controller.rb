class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

   def create
     @flight = Flight.new(flight_params)
   end

   private
   def flight_params
     params.require(:flight).permit(:name)
   end

end

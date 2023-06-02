class PassengersController < ApplicationController
  before_action :set_passenger, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  def index
    @passengers = Passenger.all
  end

 
  def show
    @passenger=Passenger.find_by(ticket_id:params[:id])
  end

 
  def new
    @passenger = Passenger.new
  end

  
  def edit
  end

 
  def create
    @passenger = Passenger.new(passenger_params)
    redirect_to search_path
  
  end

  
  def update
    
  end

  
  def destroy
   
  end

  private
   
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    
    def passenger_params
      params.require(:passenger).permit(:p_name, :p_age, :p_gender)
    end
end

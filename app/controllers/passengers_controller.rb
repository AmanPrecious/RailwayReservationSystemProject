class PassengersController < ApplicationController
  before_action :set_passenger, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /passengers or /passengers.json
  def index
    @passengers = Passenger.all
  end

  # GET /passengers/1 or /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers or /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)
  
  end

  # PATCH/PUT /passengers/1 or /passengers/1.json
  def update
    
  end

  # DELETE /passengers/1 or /passengers/1.json
  def destroy
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:p_name, :p_age, :p_gender)
    end
end

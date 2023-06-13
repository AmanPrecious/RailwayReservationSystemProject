class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  # GET /trains or /trains.json
  def index
    @trains = Train.all
  end

  # GET /trains/1 or /trains/1.json
  def show
    @train = Train.find(params[:id])
   # @train_stop= Station.find(params[:id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def train_params
      params.require(:train).permit(:train_number, :train_name, :source_station, :destination_station, :arrival_time, :departure_time,:fare)
    end
end

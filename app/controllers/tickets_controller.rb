class TicketsController < InheritedResources::Base

  before_action :authenticate_user!
  load_and_authorize_resource
 
  private

    def ticket_params
      params.require(:ticket).permit(:user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station)
    end

end

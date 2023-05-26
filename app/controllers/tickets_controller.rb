class TicketsController < InheritedResources::Base

  private

    def ticket_params
      params.require(:ticket).permit(:user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station)
    end

end

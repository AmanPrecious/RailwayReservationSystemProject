class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payment=Payment.find_by(ticket_id:params[:id])
  end

  def new
    @ticket = Ticket.find(params[:ticket_id])
    @fare= @ticket .fare.to_i *  @ticket .passengers.count
    @payment = Payment.new

  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @fare = @ticket .fare.to_i *  @ticket .passengers.count
    @payment = Payment.new(payment_params.merge!(ticket:@ticket,payment_amount: @fare, payment_status: "Done"))
    if @payment.save
      @ticket.booking_status = "Completed"
      @ticket.fare = @payment.payment_amount
      @ticket.save
      #update seat quantity
    #  @passengers = @ticket.passengers
    #  @passengers.each do |passenger|
    #     if passenger.seat_no == 0
    #        update_seat_availibility(@ticket.train_id,passenger.class_type,passenger.seat_type)
    #     end
    #  end
      redirect_to @ticket      
    else
      @passengers.each do |passenger|
         if passenger.seat_no!=0
            passenger.class_type = "NA"
            passenger.seat_type = "NA"
            passenger.seat_id = "nil"
         end
      end
      redirect_to new_ticket_path(train_id: @ticket.train_id), notice:"Validation Failed"
     end
  end

  def show
    @payment=Payment.find_by(ticket_id:params[:id])
  end
  

  
#update seat_quantity
def update_seat_availibility(train_id,class_type,seat_type)
  train=Train.find(train_id)
  seat=train.seats.where(class_type:class_type).where(seat_type:seat_type)
  quantity=Seat.find(seat.ids.join.to_i).seat_quantity
   if(quantity==0)
    @ticket.seat_quantity=0
   end
  seat.update(seat_quantity:quantity-1)
end


  private
  def payment_params
    params.require(:payment).permit(:payment_method)
  end 


end

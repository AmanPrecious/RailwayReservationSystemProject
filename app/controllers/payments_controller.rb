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
     @passengers = @ticket.passengers
        # @passenger = @passengers.first
        # set_seat_no(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
        # @passenger.save
        # update_seat_availibility(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
     @passengers.each do | passenger|
          @passenger = passenger
          set_seat_no(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
          @passenger.save
          update_seat_availibility(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
     end
      redirect_to @ticket      
    else
      redirect_to new_ticket_path(train_id: @ticket.train_id), notice:"Validation Failed"
     end
  end

  def show
    @payment=Payment.find_by(ticket_id:params[:id])
  end
  
#set_seat_no
def set_seat_no(train_id,class_type,seat_type)
  train=Train.find(train_id)
  
  if(train.seats.where(class_type: class_type).where(seat_type:seat_type).first.seat_quantity!=0)
    @passenger.seat_id=train.seats.where(class_type: class_type).where(seat_type:seat_type).first.id
    @passenger.seat_no=train.seats.where(class_type: class_type).where(seat_type:seat_type).first.seat_quantity
    @passenger.class_type = class_type
    @passenger.seat_type = seat_type 
    
  elsif(train.seats.where(class_type:"AC").where(seat_type:"LB").first.seat_quantity!=0)
    @passenger.seat_id=train.seats.where(class_type:"AC").where(seat_type:"LB").first.id
    @passenger.seat_no=train.seats.where(class_type:"AC").where(seat_type:"LB").first.seat_quantity
    @passenger.class_type = "AC"
    @passenger.seat_type = "LB" 

  elsif(train.seats.where(class_type:"AC").where(seat_type:"UB").first.seat_quantity!=0)
    @passenger.seat_id=train.seats.where(class_type:"AC").where(seat_type:"UB").first.id
    @passenger.seat_no=train.seats.where(class_type:"AC").where(seat_type:"UB").first.seat_quantity
    @passenger.class_type = "AC"
    @passenger.seat_type = "UB" 

  elsif(train.seats.where(class_type:"AC").where(seat_type:"MB").first.seat_quantity!=0)
    @passenger.seat_id=train.seats.where(class_type:"AC").where(seat_type:"MB").first.id

    @passenger.seat_no=train.seats.where(class_type:"AC").where(seat_type:"MB").first.seat_quantity
    @passenger.class_type = "AC"
    @passenger.seat_type = "MB" 

  elsif(train.seats.where(class_type:"SL").where(seat_type:"LB").first.seat_quantity!=0)
    @passenger.seat_id=train.seats.where(class_type:"SL").where(seat_type:"LB").first.id

    @passenger.seat_no=train.seats.where(class_type:"SL").where(seat_type:"LB").first.seat_quantity
    @passenger.class_type = "SL"
    @passenger.seat_type = "LB" 

  elsif(train.seats.where(class_type:"SL").where(seat_type:"MB").first.seat_quantity!=0)

    @passenger.seat_id=train.seats.where(class_type:"SL").where(seat_type:"MB").first.id

    @passenger.seat_no=train.seats.where(class_type:"SL").where(seat_type:"MB").first.seat_quantity
    @passenger.class_type = "SL"
    @passenger.seat_type = "MB" 

  elsif(train.seats.where(class_type:"SL").where(seat_type:"UB").first.seat_quantity!=0)

    @passenger.seat_id=train.seats.where(class_type:"SL").where(seat_type:"UB").first.id

    @passenger.seat_no=train.seats.where(class_type:"SL").where(seat_type:"UB").first.seat_quantity
    @passenger.class_type = "SL"
    @passenger.seat_type = "UB" 

  else
    @passenger.seat_no=0
    @passenger.class_type = class_type
    @passenger.seat_type = seat_type 
  end
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

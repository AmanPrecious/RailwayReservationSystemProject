class PassengersController < ApplicationController
  before_action :authenticate_user!
  def index
    @passengers = Passenger.find_by(ticket_id:params[:id])
  end

 
  def show
  @passenger = Passenger.find(params[:id])
  end

 
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @passenger = Passenger.new 
  end

  
  def edit
   @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @ticket = Ticket.find(@passenger.ticket_id)
    if @passenger.update(passenger_params)
      redirect_to new_ticket_passenger_path(@ticket.id),notice:"Successfully Update passenger Details"
     else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @ticket = Ticket.find(@passenger.ticket_id)
    @passenger.destroy
    redirect_to new_ticket_passenger_path(@ticket.id),notice:"Successfully Remove passenger Details"
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @passenger = Passenger.new(passenger_params.merge!(ticket:@ticket))
    set_seat_no(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
   
    if params[:continue].present?
      if @passenger.save
       update_seat_availibility(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
        redirect_to new_ticket_payment_url(@ticket.id)
      else
       redirect_to new_ticket_passenger_path(@ticket.id)
       end
    elsif params[:add_more].present?
      if @passenger.save
        update_seat_availibility(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
        # Redirect to the same page to add more passengers
        redirect_to new_ticket_passenger_path(@ticket.id),notice:"Successfully Add passenger"
      else
        redirect_to new_ticket_passenger_path(@ticket.id),notice:"Passenger Name Already Registered"
      end
    else
      if @passenger.save
        update_seat_availibility(@ticket.train_id,@passenger.class_type,@passenger.seat_type)
        redirect_to new_ticket_passenger_path(@ticket.id)
      else
       redirect_to new_ticket_passenger_path(@ticket.id)
       end
    end
    
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
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    
    def passenger_params
      params.require(:passenger).permit(:p_name, :p_age, :p_gender,:seat_type,:class_type,:seat_no)
    end
end

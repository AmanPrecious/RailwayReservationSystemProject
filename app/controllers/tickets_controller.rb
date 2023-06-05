class TicketsController < InheritedResources::Base
  before_action :authenticate_user!
  
 def index
  @tickets=Ticket.where(user_id:current_user)
 end


  def show
  @ticket =Ticket.find(params[:id])
  #@passenger=Passenger.find_by(ticket_id:params[:id])
  end




  def new
    @ticket = Ticket.new
   @passenger=@ticket.passengers.build 
   @train=Train.find(params[:train_id])
   check_seat_availibity(@train)
   @ticket = current_user.tickets.build(booking_date: Date.current,mobile:current_user.mobile,email:current_user.email,from_station:@train.source_station,to_station:@train.destination_station,seat_type:"LB",class_type:"AC")
   @ticket.train_id=params[:train_id]
   #@ticket.passengers.build
 
    # Additional passenger form fields can be built dynamically using JavaScript
  end

  def create
   @ticket = current_user.tickets.build(ticket_params)
   #check_seat_before_save(@ticket.train_id,@ticket.class_type,@ticket.seat_type)
   set_seat_no(@ticket.train_id,@ticket.class_type,@ticket.seat_type)
   if @ticket.save
    @passenger = Passenger.create(passenger_params.merge!(ticket:@ticket))
    update_seat_availibility(@ticket.train_id,@ticket.class_type,@ticket.seat_type)
    redirect_to @ticket
    #redirect_to new_ticket_payment_url(@ticket.id)
     
    else
      redirect_to new_ticket_path(train_id: @ticket.train_id),notice:"Validation Failed"
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
#set_seat_no
  def set_seat_no(train_id,class_type,seat_type)
    train=Train.find(train_id)
      
    if(train.seats.where(class_type: class_type).where(seat_type:seat_type).first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type: class_type).where(seat_type:seat_type).first.seat_quantity
      @ticket.class_type = class_type
      @ticket.seat_type = seat_type 
      
    elsif(train.seats.where(class_type:"AC").where(seat_type:"LB").first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type:"AC").where(seat_type:"LB").first.seat_quantity
      @ticket.class_type = "AC"
      @ticket.seat_type = "LB" 

    elsif(train.seats.where(class_type:"AC").where(seat_type:"UB").first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type:"AC").where(seat_type:"UB").first.seat_quantity
      @ticket.class_type = "AC"
      @ticket.seat_type = "UB" 

    elsif(train.seats.where(class_type:"AC").where(seat_type:"MB").first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type:"AC").where(seat_type:"MB").first.seat_quantity
      @ticket.class_type = "AC"
      @ticket.seat_type = "MB" 

    elsif(train.seats.where(class_type:"SL").where(seat_type:"LB").first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type:"SL").where(seat_type:"LB").first.seat_quantity
      @ticket.class_type = "SL"
      @ticket.seat_type = "LB" 

    elsif(train.seats.where(class_type:"SL").where(seat_type:"MB").first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type:"SL").where(seat_type:"MB").first.seat_quantity
      @ticket.class_type = "SL"
      @ticket.seat_type = "MB" 

    elsif(train.seats.where(class_type:"SL").where(seat_type:"UB").first.seat_quantity!=0)

      @ticket.seat_no=train.seats.where(class_type:"SL").where(seat_type:"UB").first.seat_quantity
      @ticket.class_type = "SL"
      @ticket.seat_type = "UB" 

    else
      @ticket.seat_no=0
      @ticket.class_type = class_type
      @ticket.seat_type = seat_type 
    end
  end
  

 #check seat availibility
  def check_seat_availibity(train)
    sl =train.seats.where(class_type:"SL").sum(:seat_quantity)
    ac =train.seats.where(class_type:"AC").sum(:seat_quantity)
    if(sl==0 && ac==0)
     redirect_to search_url
    end

    
  end



 

  private

    def ticket_params
      params.require(:ticket).permit(:user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station,:email ,:mobile,:seat_no,:seat_type,:class_type,passengers_attributes: [:p_name, :p_age, :p_gender])
    end

    def passenger_params
      ticket = params[:ticket]
      ticket.require(:passenger).permit(:p_name, :p_age, :p_gender)
    end 



end


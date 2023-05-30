class TicketsController < InheritedResources::Base
  before_action :authenticate_user!
  

  def new


   @train=Train.find(params[:train_id])
   check_seat_availibity(@train)
   @ticket = current_user.tickets.build(booking_date: Date.current,mobile:current_user.mobile,email:current_user.email,from_station:@train.source_station,to_station:@train.destination_station,seat_type:"LB",class_type:"AC")
   @ticket.train_id=params[:train_id]
   #@ticket.passengers.build
 
    # Additional passenger form fields can be built dynamically using JavaScript
  end

  def create
    
   @ticket = current_user.tickets.build(ticket_params)
   check_seat_before_save(@ticket.train_id,@ticket.class_type,@ticket.seat_type)
   set_seat_no(@ticket.train_id,@ticket.class_type,@ticket.seat_type)
   if @ticket.save
    update_seat_availibility(@ticket.train_id,@ticket.class_type,@ticket.seat_type)
    redirect_to @ticket
      # Update seat availability and perform other necessary actions
      # Handle successful ticket booking
    else
      render :new, status: :unprocessable_entity
      # Handle ticket booking failure
    end
  end

#update seat_quantity
  def update_seat_availibility(train_id,class_type,seat_type)
     train=Train.find(train_id)
     seat=train.seats.where(class_type:class_type).where(seat_type:seat_type)
     quantity=Seat.find(seat.ids.join.to_i).seat_quantity
     seat.update(seat_quantity:quantity-1)
  end
#set_seat_no
  def set_seat_no(train_id,class_type,seat_type)
    train=Train.find(train_id)
    seat=train.seats.where(class_type:class_type).where(seat_type:seat_type)
    quantity=Seat.find(seat.ids.join.to_i).seat_quantity
    if(quantity==0)
      errors.ticket "seat not available"
     redirect_to new_ticket_url
    end
    @ticket.seat_no=quantity
 end

 #check seat availibility
  def check_seat_availibity(train)

    sl =train.seats.where(class_type:"SL").sum(:seat_quantity)
    ac =train.seats.where(class_type:"AC").sum(:seat_quantity)
    if(sl==0 && ac==0)
     redirect_to search_url
    end
    
  end

   #check seat availibility before save AC/SL
   def check_seat_before_save(train_id,class_type,seat_type)
    train=Train.find(train_id)
    seat=train.seats.where(class_type:class_type).where(seat_type:seat_type)
    quantity=Seat.find(seat.ids.join.to_i).seat_quantity
    if(quantity==0)
      errors.ticket "seat not available"
     redirect_to new_ticket_url
    end
    
  end

  private

    def ticket_params
     # params.require(:ticket).permit(:train_id, passengers_attributes: [:id, :name, :age]) # Add more passenger fields as required
      params.require(:ticket).permit(:user_id, :train_id, :booking_status, :booking_date, :from_station, :to_station,:email , :mobile,:seat_no,:seat_type,:class_type)
    end

end


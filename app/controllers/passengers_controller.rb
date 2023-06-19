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
   
    if params[:continue].present?
      if @passenger.save
        redirect_to new_ticket_payment_url(@ticket.id)
      else
       redirect_to new_ticket_passenger_path(@ticket.id),notice:"Passenger Name Already Registered"
       end
    elsif params[:add_more].present?
      if @passenger.save
        # Redirect to the same page to add more passengers
        redirect_to new_ticket_passenger_path(@ticket.id),notice:"Successfully Add passenger"
      else
        redirect_to new_ticket_passenger_path(@ticket.id),notice:"Passenger Name Already Registered"
      end
    else
      if @passenger.save
        redirect_to new_ticket_passenger_path(@ticket.id)
      else
       redirect_to new_ticket_passenger_path(@ticket.id),notice:"Passenger Name Already Registered"
       end
    end
    
  end

  private
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    
    def passenger_params
      params.require(:passenger).permit(:p_name, :p_age, :p_gender,:seat_type,:class_type,:seat_no)
    end
end

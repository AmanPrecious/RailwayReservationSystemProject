class UserMailer < ApplicationMailer
    default from: 'railwayreservation@system.com'

    #send welcom mail to user
  def send_welcome_email(user)
     @user = user
     mail(to: @user.email, subject: 'Welcome to Railway Reservation System')
  end


  #send_ticket to user
  def send_tickets(user)
     @user = user
     mail(to:@user.email,subject: 'Your Ticket Booked Successfully')
  end

  #seat confirmation mail to user
  def send_seat_confirmation(user,id)
     @user = user
     @ticket = Ticket.find(id)
     mail(to:@user.email,subject: 'Your Ticket Confirmation status')
  end
end

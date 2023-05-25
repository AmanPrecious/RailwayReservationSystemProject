class UserMailer < ApplicationMailer
    default from: 'railwayreservation@system.com'

    #send welcom mail to user
  def send_welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Railway Reservation System')
  end


  
end

class AdminMailer < ApplicationMailer

  #default to: -> {AdminUser.pluck(:email)}
  #send new user registred mail to Admin
 # def new_registration_mail(user)
  #  @user = user
   # mail(subject: "New User Signup: #{@user.email}")
  #end

  #def send_tickets_admin(user)
  #@user = user
  #mail(subject: "New Ticket Booked: #{@user.email}")
  #end

#end


def new_registration_mail(user)
  @user = user
  mail(to: AdminUser.pluck(:email), subject: "New User Signup: #{@user.email}") if  AdminUser.count.positive?
end

def send_tickets_admin(user)
 @user = user
 mail(to: AdminUser.pluck(:email), subject: "New Ticket Booked: #{@user.email}") if  AdminUser.count.positive?
end

end
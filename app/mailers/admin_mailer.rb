class AdminMailer < ApplicationMailer
    default to: -> {AdminUser.pluck(:email)}
  #send new user registred mail to Admin
  def new_registration_mail(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end

  def send_ticket_admin(user)
    AdminMailer.send_ticket_admin(self).deliver_now
  end

end

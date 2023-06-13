class Payment < ApplicationRecord
  belongs_to :ticket


  after_create :send_ticket,:send_ticket_admin

  def send_ticket  
    UserMailer.send_tickets(ticket.user).deliver_now
  end

  def send_ticket_admin
    AdminMailer.send_tickets_admin(ticket.user).deliver_now
  end

end

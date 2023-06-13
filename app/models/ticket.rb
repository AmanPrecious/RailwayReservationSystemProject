class Ticket < ApplicationRecord
  
  validates :mobile, presence: true, length: { is: 10}
  validates :email,:booking_date,:booking_status,:from_station,:to_station  ,presence: true
  validate :booking_date_cannot_be_in_the_past

  belongs_to :user
  belongs_to :train
  
  has_many :passengers, dependent: :destroy
  has_one :payment, dependent: :destroy

  #before_save :check_seat_before_save
  #after_create :send_ticket,:send_ticket_admin
  after_update :seat_confirmed_mail


  #booking date not in past
  def booking_date_cannot_be_in_the_past
    if booking_date.present? && booking_date < Date.today
      errors.add(:booking_date, "can't be in the past")
    end
  end   

   #check seat availibility before save AC/SL
  # def check_seat_before_save()
  #   seat=train.seats.where(class_type: class_type).where(seat_type:seat_type).first
  #   if(seat.seat_quantity == 0)
  #     errors.add(:seat_type,"Selected Seat Not Available")
  #   end
  # end

  # def send_ticket  
  #   UserMailer.send_tickets(self).deliver_now
  # end

  # def send_ticket_admin
  #   AdminMailer.send_tickets_admin(self).deliver_now
  # end

  def seat_confirmed_mail
    UserMailer.send_seat_confirmation(self,id).deliver_now
  end


end

class Ticket < ApplicationRecord
  
  validates :mobile, presence: true, length: { is: 10}
  validates :email, presence: true
  
  belongs_to :user
  belongs_to :train
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: :all_blank
  has_one :payment, dependent: :destroy

  before_save :check_seat_before_save
  after_create :send_ticket,:send_ticket_admin
  after_update :seat_confirmed_mail

   #check seat availibility before save AC/SL
  def check_seat_before_save()
    seat=train.seats.where(class_type: class_type).where(seat_type:seat_type).first
    if(seat.seat_quantity == 0)
      errors.add(:seat_type,"Selected Seat Not Available")
    end
  end

  def send_ticket  
    UserMailer.send_tickets(self).deliver_now
  end

  def send_ticket_admin
    AdminMailer.send_tickets_admin(self).deliver_now
  end

  def seat_confirmed_mail
    UserMailer.send_seat_confirmation(self).deliver_now
  end


end

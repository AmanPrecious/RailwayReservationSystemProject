class Ticket < ApplicationRecord
  #validates :mobile,presence: true, length: { is: 10},uniqueness: true
 # validates :email,presence: true
  

  belongs_to :user
  belongs_to :train
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: :all_blank
  has_one :payment, dependent: :destroy

  before_save :check_seat_before_save
  after_save :send_ticket,:send_ticket_admin

   #check seat availibility before save AC/SL
  def check_seat_before_save()
    seat=train.seats.where(class_type: class_type).where(seat_type:seat_type).first
    if(seat.seat_quantity==0)
     errors "seat not available"
    end
  end

  def send_ticket  
    UserMailer.send_ticket(self).deliver_now
  end

  def send_ticket_admin
    AdminMailer.send_ticket_admin(self).deliver_now
  end




end

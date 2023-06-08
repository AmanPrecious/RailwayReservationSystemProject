class User < ApplicationRecord

  validates :first_name, :last_name, :mobile, :address, presence: true
  validates :mobile,presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :tickets,dependent: :destroy
  
  after_create :send_email,:send_email_admin
         
  def send_email  
    UserMailer.send_welcome_email(self).deliver_now
  end

  def send_email_admin
    AdminMailer.new_registration_mail(self).deliver_now
  end

 

end

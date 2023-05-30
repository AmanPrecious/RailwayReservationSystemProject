class Ticket < ApplicationRecord

  belongs_to :user
  belongs_to :train
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
  has_one :payment,dependent: :destroy



end

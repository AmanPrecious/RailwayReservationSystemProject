class Passenger < ApplicationRecord
  validates :p_age,:p_gender,presence: true
  validates :p_name, presence: true
  validates_uniqueness_of :p_name, scope: [:ticket_id]
  belongs_to :ticket
  belongs_to :seat,optional: true
end

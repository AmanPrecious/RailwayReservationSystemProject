class Passenger < ApplicationRecord
  validates :p_name, :p_age, :p_gender,presence: true
  belongs_to :ticket

end

class Passenger < ApplicationRecord
  validates_presence_of :p_name, :p_age,:p_gender
  belongs_to :ticket

end

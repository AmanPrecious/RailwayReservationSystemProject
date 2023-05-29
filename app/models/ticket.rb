class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :passenger
end

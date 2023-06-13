class Seat < ApplicationRecord
  belongs_to :train
  has_one :passenger
  validates_uniqueness_of :train_id, scope: [:class_type,:seat_type]
end

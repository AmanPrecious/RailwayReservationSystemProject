class Seat < ApplicationRecord
 # enum class_type: [ :GEN, :SL, :AC]
  #enum seat_type: [ :LB, :MB, :UB]
  belongs_to :train
  validates_uniqueness_of :train_id, scope: [:class_type,:seat_type]
end

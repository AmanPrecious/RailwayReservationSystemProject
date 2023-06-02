class TrainStation < ApplicationRecord
    belongs_to :train
    belongs_to :station
    
end

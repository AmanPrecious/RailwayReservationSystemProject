class Station < ApplicationRecord

    validates :stn_name,presence: true,uniqueness: true
    validates :stn_code,presence: true, length: { is: 4},uniqueness: true
    validates :stn_location,presence: true

    has_many :train_stations
    has_many :trains, through: :train_stations

end

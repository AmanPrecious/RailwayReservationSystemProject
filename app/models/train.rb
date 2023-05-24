class Train < ApplicationRecord

    validates :train_number, :train_name ,:source_station,:destination_station, :arrival_time, :departure_time,presence: true
    validates :train_number,length: { is: 4 },uniqueness: true

    has_many :train_stations
    has_many :stations, through: :train_stations

end

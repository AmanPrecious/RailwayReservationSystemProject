class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.integer :train_number
      t.string :train_name
      t.string :source_station
      t.string :destination_station
      t.datetime :arrival_time
      t.datetime :departure_time

      t.timestamps
    end
  end
end

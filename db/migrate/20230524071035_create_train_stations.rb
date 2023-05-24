class CreateTrainStations < ActiveRecord::Migration[7.0]
  def change
    create_table :train_stations do |t|

      t.timestamps
    end
  end
end

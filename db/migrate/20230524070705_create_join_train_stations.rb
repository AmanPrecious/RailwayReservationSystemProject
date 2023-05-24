class CreateJoinTrainStations < ActiveRecord::Migration[7.0]
  def change
    create_table :join_train_stations do |t|
      t.references :train, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end

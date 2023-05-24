class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :stn_name
      t.string :stn_location
      t.string :stn_code

      t.timestamps
    end
  end
end

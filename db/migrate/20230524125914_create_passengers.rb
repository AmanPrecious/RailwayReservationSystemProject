class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :p_name
      t.integer :p_age
      t.string :p_gender
      t.timestamps
    end
  end
end

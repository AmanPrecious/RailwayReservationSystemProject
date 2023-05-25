class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :class_type
      t.string :seat_type
      t.integer :seat_quantity
      t.string :seat_status
      t.references :train, null: false, foreign_key: true

      t.timestamps
    end
  end
end

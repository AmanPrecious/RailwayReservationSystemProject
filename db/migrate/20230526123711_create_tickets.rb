class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :train, null: false, foreign_key: true
      t.string :booking_status
      t.date :booking_date
      t.string :from_station
      t.string :to_station
      t.string :class_type
      t.string :seat_type
      t.string :seat_no
      t.integer :mobile
      t.string :email

      t.timestamps
    end
  end
end

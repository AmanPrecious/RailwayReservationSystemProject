class AddPassengerToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :passenger, null: false, foreign_key: true
  end
end

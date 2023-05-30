class RemovePassengerRefFromTickets < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tickets, :passenger, null: false, foreign_key: true
  end
end

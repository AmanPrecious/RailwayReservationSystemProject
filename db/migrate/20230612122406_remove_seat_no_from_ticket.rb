class RemoveSeatNoFromTicket < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :seat_no, :string
  end
end

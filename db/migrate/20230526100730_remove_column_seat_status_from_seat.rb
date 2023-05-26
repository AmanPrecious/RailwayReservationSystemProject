class RemoveColumnSeatStatusFromSeat < ActiveRecord::Migration[7.0]
  def change
    remove_column :seats, :seat_status, :string
  end
end

class RemoveColumnFromTicket < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :class_type, :string
    remove_column :tickets, :seat_type, :string
  end
end

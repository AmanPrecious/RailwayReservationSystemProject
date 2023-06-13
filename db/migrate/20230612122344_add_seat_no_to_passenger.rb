class AddSeatNoToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :seat_no, :string
  end
end

class AddSeatRefToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_reference :passengers, :seat, null: true,foreign_key: true, index: true
  end
end

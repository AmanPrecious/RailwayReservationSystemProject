class AddColumnToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :class_type, :string
    add_column :passengers, :seat_type, :string
  end
end

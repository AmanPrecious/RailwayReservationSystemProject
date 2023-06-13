class AddFareToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :fare, :string
  end
end

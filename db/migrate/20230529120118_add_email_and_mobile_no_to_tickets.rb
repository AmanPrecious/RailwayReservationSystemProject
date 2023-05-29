class AddEmailAndMobileNoToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :email, :string
    add_column :tickets, :mobile, :integer
  end
end

class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.string :payment_status
      t.integer :payment_amount
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end

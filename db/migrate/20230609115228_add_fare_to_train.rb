class AddFareToTrain < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :fare, :string
  end
end

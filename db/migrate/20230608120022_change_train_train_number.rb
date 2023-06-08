class ChangeTrainTrainNumber < ActiveRecord::Migration[7.0]
  def up
    change_table :trains do |t|
      t.change :train_number, :string
    end
  end

  def down
    change_table :trains do |t|
      t.change :train_number, :integer
    end
  end
end

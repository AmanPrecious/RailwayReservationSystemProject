class ChangeUserMobile < ActiveRecord::Migration[7.0]
  def up
    change_table :users do |t|
      t.change :mobile, :string
    end
  end

  def down
    change_table :users do |t|
      t.change :mobile, :integer
    end
  end
end

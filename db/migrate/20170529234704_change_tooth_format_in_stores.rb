class ChangeToothFormatInStores < ActiveRecord::Migration
  def up
    change_column :stores, :tooth, :string
    change_column_default :stores, :cant,  0
  end

  def down
    change_column :stores, :tooth, :integer
    change_column_default :stores, :cant,  1
  end
end

class AddOrderIdToItem < ActiveRecord::Migration
  def change
    add_reference :items, :order, index: true
    add_foreign_key :items, :orders
  end
end

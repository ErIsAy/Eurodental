class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :age
      t.string :sex
      t.text :client_note
      t.text :other_note

      t.timestamps null: false
    end
  end
end

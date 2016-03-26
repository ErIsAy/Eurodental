class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :patient_name
      t.integer :age
      t.string :sex
      t.text :client_note
      t.text :other_note

      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

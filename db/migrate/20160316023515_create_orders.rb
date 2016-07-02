class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :patient_name
      t.integer :age
      t.string :sex
      t.text :client_note
      t.text :other_note
      t.boolean :coti
      t.integer :total_price
      t.boolean  :antagonista
      t.boolean  :foto
      t.boolean  :mordida
      t.string :state, default: "nueva"
      t.integer :quantity, default: 1
      #t.integer :state, :default => 0
        # pendiente = 0
        # procesada = 1


      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

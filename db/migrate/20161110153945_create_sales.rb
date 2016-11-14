class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :patient_name
      t.integer :age
      t.string :sex
      t.date :order_date
      t.string :client_note
      t.string :other_note
      t.boolean :coti, :default => false
      t.integer :invoice_num
      t.string :state,         default: "En proceso"
      t.string :concept
      t.decimal :total_amount, precision: 8, scale: 2, default: 0
      t.decimal :discount, default: 0
      t.decimal :discount_amount, precision: 8, scale: 2, default: 0
      t.decimal  :remaining_amount, precision: 8, scale: 2, default: 0
      t.belongs_to :client, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end

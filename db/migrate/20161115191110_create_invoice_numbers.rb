class CreateInvoiceNumbers < ActiveRecord::Migration
  def change
    create_table :invoice_numbers do |t|
      t.belongs_to :sale, index: true, foreign_key: true
      t.integer :next_number, default: 1

      t.timestamps null: false
    end

    add_index :invoice_numbers, [:sale_id, :next_number], unique: true
  end
end

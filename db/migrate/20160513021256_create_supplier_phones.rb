class CreateSupplierPhones < ActiveRecord::Migration
  def change
    create_table :supplier_phones do |t|
      t.string :phone
      t.string :ptype
      t.belongs_to :supplier, index: true

      t.timestamps null: false
    end
    add_foreign_key :supplier_phones, :suppliers
  end
end

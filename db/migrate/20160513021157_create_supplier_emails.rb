class CreateSupplierEmails < ActiveRecord::Migration
  def change
    create_table :supplier_emails do |t|
      t.string :email
      t.belongs_to :supplier, index: true

      t.timestamps null: false
    end
    add_foreign_key :supplier_emails, :suppliers
  end
end

class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.string :payment_type
      t.belongs_to :sale

      t.timestamps null: false
    end
  end
end

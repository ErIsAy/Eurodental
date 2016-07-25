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
      t.string :state, default: "En proceso"
      t.integer :quantity, default: 1

      #Tooth list attributes
      t.integer	:t1,	default: 0
      t.integer	:t2,	default: 0
      t.integer	:t3,	default: 0
      t.integer	:t4,	default: 0
      t.integer	:t5,	default: 0
      t.integer	:t6,	default: 0
      t.integer	:t7,	default: 0
      t.integer	:t8,	default: 0
      t.integer	:t9,	default: 0
      t.integer	:t10,	default: 0
      t.integer	:t11,	default: 0
      t.integer	:t12,	default: 0
      t.integer	:t13,	default: 0
      t.integer	:t14,	default: 0
      t.integer	:t15,	default: 0
      t.integer	:t16,	default: 0
      t.integer	:t17,	default: 0
      t.integer	:t18,	default: 0
      t.integer	:t19,	default: 0
      t.integer	:t20,	default: 0
      t.integer	:t21,	default: 0
      t.integer	:t22,	default: 0
      t.integer	:t23,	default: 0
      t.integer	:t24,	default: 0
      t.integer	:t25,	default: 0
      t.integer	:t26,	default: 0
      t.integer	:t27,	default: 0
      t.integer	:t28,	default: 0
      t.integer	:t29,	default: 0
      t.integer	:t30,	default: 0
      t.integer	:t31,	default: 0
      t.integer	:t32,	default: 0


      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

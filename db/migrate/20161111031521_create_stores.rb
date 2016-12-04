class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :tooth
      t.integer :tooth_element
      t.integer :cant, :default => 1
      t.boolean :antagonista, :default => false
      t.boolean :mordida, :default => false
      t.string :note
      t.string :color_note
      t.boolean :implant, :default => false
      t.string :brand
      t.decimal :amount, precision: 8, scale: 2
      t.belongs_to :sale, index: true, foreign_key: true

      t.belongs_to :worktype, index: true, foreign_key: true
      t.belongs_to :material, index: true, foreign_key: true
      t.belongs_to :mcolor, index: true, foreign_key: true
      t.belongs_to :gcolor, index: true, foreign_key: true
      t.belongs_to :procedure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

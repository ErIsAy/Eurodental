class CreateGcolors < ActiveRecord::Migration
  def change
    create_table :gcolors do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      # t.belongs_to :store, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

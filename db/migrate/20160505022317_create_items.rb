class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :categories
  end
end

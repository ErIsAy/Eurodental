class CreateClientPhones < ActiveRecord::Migration
  def change
    create_table :client_phones do |t|
      t.string :phone
      t.belongs_to :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :client_phones, :clients
  end
end

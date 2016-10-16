class CreateClientEmails < ActiveRecord::Migration
  def change
    create_table :client_emails do |t|
      t.string :email
      t.belongs_to :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :client_emails, :clients
  end
end

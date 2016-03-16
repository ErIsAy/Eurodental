class AddPatientIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :patient_id, :integer
    add_column :orders, :client_id, :integer
    add_index :orders, :patient_id
    add_index :orders, :client_id

    add_reference :patients, :orders, index: true, foreign_key: true
    add_reference :clients, :orders, index: true, foreign_key: true
  end
end

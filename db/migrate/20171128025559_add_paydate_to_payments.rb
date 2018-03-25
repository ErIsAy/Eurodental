class AddPaydateToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :paydate, :datetime
  end
end

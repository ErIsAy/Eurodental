class CreateUserMonitors < ActiveRecord::Migration
  def change
    create_table :user_monitors do |t|
      t.integer :user
      t.string :info

      t.timestamps null: false
    end
  end
end

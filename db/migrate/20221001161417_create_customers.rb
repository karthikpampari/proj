class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password
      t.integer :role ,default: 0

      t.timestamps
    end
  end
end
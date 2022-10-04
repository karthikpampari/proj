class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    drop_table :warehouses
    create_table :warehouses do |t|
      t.string :name

      t.timestamps
    end
  end
end

class ChangesInWarehouse < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses,:quantity,:integer
    add_column :warehouses,:warehouse_charges,:integer
  end
end

class CreateJoinTableWarehousesProducts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :products, :warehouses do |t|
      # t.index [:product_id, :warehouse_id]
      # t.index [:warehouse_id, :product_id]
    end
    drop_table :warhouses
  end
end

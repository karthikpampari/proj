class Changes1 < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :warehouses, :products
    add_column :products,:warehouse_id,:integer
    add_column :products,:pcount_war,:integer,default: 0
    add_column :products,:pcount_cus,:integer,default: 0
  end
end

class CreateWarhouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warhouses do |t|

      t.timestamps
    end
  end
end

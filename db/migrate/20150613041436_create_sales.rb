class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :project_id
      t.integer :product_id
      t.integer :lot_unit_id
      t.integer :phase_id
      t.integer :user_id
      t.integer :status_id

      t.timestamps null: false
    end

    add_index :sales, :project_id
    add_index :sales, :product_id
    add_index :sales, :lot_unit_id
    add_index :sales, :phase_id
    add_index :sales, :user_id
    add_index :sales, :status_id
  end
end

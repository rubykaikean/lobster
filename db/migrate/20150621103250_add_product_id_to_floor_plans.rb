class AddProductIdToFloorPlans < ActiveRecord::Migration
  def change
    remove_column :floor_plans, :project_id
    add_column :floor_plans, :product_id, :integer
    add_index :floor_plans, :product_id
  end
end

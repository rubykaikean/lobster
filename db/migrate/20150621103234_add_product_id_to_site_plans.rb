class AddProductIdToSitePlans < ActiveRecord::Migration
  def change
    remove_column :site_plans, :project_id
    add_column :site_plans, :product_id, :integer
    add_index :site_plans, :product_id
  end
end

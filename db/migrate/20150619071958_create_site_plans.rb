class CreateSitePlans < ActiveRecord::Migration
  def change
    create_table :site_plans do |t|
      t.integer :project_id

      t.timestamps null: false
    end

    add_index :site_plans, :project_id
  end
end

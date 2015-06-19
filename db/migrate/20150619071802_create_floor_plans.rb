class CreateFloorPlans < ActiveRecord::Migration
  def change
    create_table :floor_plans do |t|
      t.integer :project_id

      t.timestamps null: false
    end

    add_index :floor_plans, :project_id
  end
end

class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.text :description
      t.integer :status_id
      t.integer :project_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :phases, :slug, unique: true
    add_index :phases, :project_id
  end
end

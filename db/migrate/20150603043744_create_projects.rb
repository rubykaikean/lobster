class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :status_id
      t.integer :company_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :projects, :slug, unique: true
    add_index :projects, :company_id
  end
end

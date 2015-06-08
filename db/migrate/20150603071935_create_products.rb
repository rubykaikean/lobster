class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :type_id
      t.text :description
      t.integer :status_id
      t.integer :phase_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :products, :slug, unique: true
    add_index :products, :phase_id
  end
end

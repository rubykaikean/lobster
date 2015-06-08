class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.text :description
      t.integer :product_id
			t.string :slug

      t.timestamps null: false
    end
    add_index :lots, :slug, unique: true
    add_index :lots, :product_id
  end
end

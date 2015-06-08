class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.integer :product_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :product_types, :slug, unique: true
    add_index :product_types, :product_id
  end
end
